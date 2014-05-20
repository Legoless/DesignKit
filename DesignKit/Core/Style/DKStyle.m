//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKStyle.h"

@interface DKStyle ()

//
// Cached values for outside access
//
@property (nonatomic, strong, readwrite) NSString* styleKey;

@property (nonatomic, strong, readwrite) NSDictionary* properties;

@property (nonatomic, strong, readwrite) NSDictionary *propertiesPropertyList;

//
// Private variables
//

@property (nonatomic, strong) NSMutableDictionary *propertiesCache;

@end

@implementation DKStyle

- (NSMutableDictionary *)propertiesCache
{
    if (!_propertiesCache)
    {
        _propertiesCache = [NSMutableDictionary dictionary];
    }

    return _propertiesCache;
}

- (id)init
{
    return nil;
}

- (id)initWithStyleKey:(NSString *)styleKey
{
    return [self initWithStyleKey:styleKey properties:nil];
}

- (id)initWithStyleKey:(NSString *)styleKey properties:(NSDictionary *)dictionary
{
    self = [super init];

    if (self)
    {
        self.styleKey = styleKey;

        [self.propertiesCache addEntriesFromDictionary:dictionary];

        [self synchronize];
    }

    return self;
}

- (id)propertyForKey:(NSString *)key
{
    return [self propertyForKey:key forState:UIControlStateNormal];
}

- (id)propertyForKey:(NSString *)key forState:(UIControlState)state
{
    key = [self keyStringWithKey:key forState:state];

    return self.propertiesCache[key];
}

- (void)setPropertyForKey:(NSString *)key withProperty:(id)object
{
    [self setPropertyForKey:key withProperty:object forState:UIControlStateNormal];
}

- (void)setPropertyForKey:(NSString *)key withProperty:(id)object forState:(UIControlState)state
{
    key = [self keyStringWithKey:key forState:state];

    self.propertiesCache[key] = object;

    [self synchronize];
}

- (id)objectForKeyedSubscript:(id)key
{
    return [self propertyForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(id <NSCopying>)aKey
{
    [self setPropertyForKey:aKey withProperty:object];
}

#pragma mark Private methods

- (void)synchronize
{
    self.propertiesPropertyList = [self.propertiesCache copy];

    self.properties = [self.propertiesCache copy];
}

- (NSString *)keyStringWithKey:(NSString *)key forState:(UIControlState)state
{
    //
    // Add states to key so we match the NUI naming scheme
    //

    if (state == UIControlStateSelected)
    {
        key = [key stringByAppendingString:@"-selected"];
    }

    if (state == UIControlStateDisabled)
    {
        key = [key stringByAppendingString:@"-disabled"];
    }

    if (state == UIControlStateHighlighted)
    {
        key = [key stringByAppendingString:@"-highlighted"];
    }

    //
    // A weird case of insets parameter must be on the end, we fix this by appending the insets string and removing it in middle
    //

    if ([key rangeOfString:@"insets"].location != NSNotFound && ![key hasSuffix:@"insets"])
    {
        key = [key stringByReplacingOccurrencesOfString:@"insets-" withString:@""];
        key = [key stringByAppendingString:@"-insets"];
    }

    return key;
}

@end