//
// Created by Dal Rupnik on 12/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "NUISettings+DesignKit.h"

#import "DesignKit.h"

@interface DesignKit ()

/*!
 * Holds a strong pointer to NUI settings to keep in sync
 */
@property (nonatomic, strong) NUISettings* 3nuiSettings;

/*!
 * Check for this to ensure we have a style ready
 */
@property (nonatomic, getter = isSetuped) BOOL setuped;

@end

@implementation DesignKit

#pragma mark Static Methods

+ (void)setup
{
    [self setupWithStylesheet:nil];
}

+ (void)setupWithStylesheetPath:(NSString *)path
{
    DKStylesheet * stylesheet = [[DKStylesheet alloc] initWithFilePath:path];

    [self setupWithStylesheet:stylesheet];
}

+ (void)setupWithStylesheet:(DKStylesheet *)stylesheet
{
    [[self design] setupWithStylesheet:stylesheet];
}

/*!
 * Sets stylesheet and takes care of observer, because the DesinKit is very interested
 */
- (void)setStylesheet:(DKStylesheet *)stylesheet
{
    //
    // If there was a stylesheet set, we need to remove self as a observer
    //

    if (_stylesheet)
    {
        [_stylesheet removeObserver:self forKeyPath:@"styles"];
    }

    _stylesheet = stylesheet;

    [_stylesheet addObserver:self forKeyPath:@"styles" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)setupWithStylesheet:(DKStylesheet *)stylesheet
{
    //
    // Create a stylesheet
    //

    if (!stylesheet)
    {
        stylesheet = [[DKStylesheet alloc] init];
    }



    //
    // Load NUISettings based on stylesheet path
    //

    if ([stylesheet.filePath length])
    {
        [NUISettings initWithStylesheet:stylesheet.filePath];
    }
    else
    {
        [NUISettings init];
    }

    // Store default settings
    self.nuiSettings = [NUISettings defaultSettings];

    //
    // Synchronize NUISettings with DKStylesheet settings, very easy, huh?
    //

    [self synchronizeWithNUISettings];

    self.stylesheet = stylesheet;

    self.setuped = YES;
}

- (void)synchronizeWithNUISettings
{
    [self.stylesheet appendStyles:self.nuiSettings.styles];

    // Just ensure that we do not delete the reference of the dictionary, to keep it clean.
    [self.nuiSettings.styles removeAllObjects];
    [self.nuiSettings.styles addEntriesFromDictionary:self.stylesheet.stylePropertyList];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"styles"])
    {
        [self synchronizeWithNUISettings];
    }
}

@end