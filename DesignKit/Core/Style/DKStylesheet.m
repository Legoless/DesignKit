//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <Haystack/Haystack.h>

#import "DKStylesheet.h"
#import "NSObject+PropertyList.h"
#import "DKConstants.h"
#import "NUISettings+DesignKit.h"

@interface DKStylesheet ()

/*!
 * Contains readonly file path
 */
@property (nonatomic, strong, readwrite) NSString* filePath;

/*!
 * Holds strong pointer to all styles, so we keep them around.
 */
@property (nonatomic, strong) NSMutableDictionary* styleCache;

/*!
 * Holds a strong pointer to styles dictionary, to support KVO
 */
@property (nonatomic, strong, readwrite) NSDictionary* styles;

/*!
 * Holds a strong pointer to styles property list dictionary, to support KVO
 */
@property (nonatomic, strong, readwrite) NSDictionary* stylePropertyList;

/*!
 * Tells us if we are in middle of changing state, so we do not call synchronize too many times,
 * works as a temporary mutex.
 */
@property (nonatomic, getter = isStateChanging) BOOL stateChanging;

@end

@implementation DKStylesheet

#pragma mark Setters and getters

- (NSMutableDictionary *)styleCache
{
    if (!_styleCache)
    {
        _styleCache = [NSMutableDictionary dictionary];
    }

    return _styleCache;
}

#pragma mark Initializers

- (id)initWithFilePath:(NSString *)filePath
{
    self = [super init];

    if (self)
    {
        self.filePath = filePath;
    }

    return self;
}

- (id)initWithStyles:(id)styles
{
    self = [super init];

    if (self)
    {
        [self appendStyles:styles];
    }

    return self;
}

#pragma mark Public methods

- (DKStyle *)styleForClass:(Class)class
{
    NSString* classString = NSStringFromClass(class);

    //
    // Clean up the common prefixes of UIKit and DesignKit
    //

    classString = [classString stringByReplacingOccurrencesOfString:@"UI" withString:@""];
    classString = [classString stringByReplacingOccurrencesOfString:@"DK" withString:@""];

    return self.styleCache[classString];
}

- (DKStyle *)styleForStyleKey:(NSString *)styleKey
{
    return self.styleCache[styleKey];
}

- (void)appendStyles:(id)styles
{
    if ([styles isKindOfClass:[NSArray class]])
    {
        self.stateChanging = YES;

        NSArray* array = styles;

        for (id object in array)
        {
            if ([object isKindOfClass:[DKStyle class]])
            {
                [self addStyle:object];
            }
            else
            {
                self.stateChanging = NO;

                [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Style must be a property list or DKStyle class." userInfo:@{ DKStyleClassExceptionInfo : object}] raise];
            }
        }

        self.stateChanging = NO;

        [self synchronize];
    }
    else if ([styles isKindOfClass:[NSDictionary class]])
    {
        self.stateChanging = YES;

        if ([styles isPropertyList])
        {
            for (id key in [styles allKeys])
            {
                [self addStyle:styles[key] withStyleKey:key];
            }
        }
        else
        {
            for (id key in [styles allKeys])
            {
                if ([styles[key] isKindOfClass:[DKStyle class]])
                {
                    [self addStyle:styles[key]];
                }
                else
                {
                    self.stateChanging = YES;

                    [[NSException exceptionWithName:NSInternalInconsistencyException reason:@"Style must be a property list or DKStyle class." userInfo:@{ DKStyleClassExceptionInfo : styles[key] }] raise];
                }
            }
        }

        self.stateChanging = NO;

        [self synchronize];
    }
    else
    {
        [NSException raise:NSInternalInconsistencyException format:@"Style must be a property list or DKStyle class."];
    }
}

- (void)addStyle:(NSDictionary *)style withStyleKey:(NSString *)styleKey
{
    //
    // Get style if it exists and overwrite the properties
    //

    [self addStyle:[[DKStyle alloc] initWithStyleKey:styleKey properties:style]];
}

- (void)addStyle:(DKStyle *)style
{
    //
    // Replace style properties
    //
    if (self.styleCache[style.styleKey])
    {
        [self.styleCache[style.styleKey] removeObserver:self forKeyPath:@"properties"];
    }

    self.styleCache[style.styleKey] = style;

    //
    // Add the master of the style as a observer when the properties change,
    // so we can tell DesignKit to rerender the things.
    //

    [style addObserver:self forKeyPath:@"properties" options:NSKeyValueObservingOptionNew context:NULL];

    [self synchronize];
}

- (void)synchronize
{
    if (self.isStateChanging)
    {
        return;
    }

    self.styles = [self.styleCache copy];
    self.stylePropertyList = [self createStylePropertyList];
}

#pragma mark Utility methods
- (NSDictionary *)createStylePropertyList
{
    //
    // Construct new style dictionary with only property list
    //
    NSMutableDictionary *styles = [NSMutableDictionary dictionary];

    for (id key in [self.styleCache allKeys])
    {
        styles[key] = [self.styleCache[key] propertiesPropertyList];
    }

    return [styles copy];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"properties"])
    {
        [self synchronize];
    }
}

@end