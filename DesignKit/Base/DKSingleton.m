//
// Created by Dal Rupnik on 06/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKSingleton.h"

static NSMutableDictionary *_sharedInstances = nil;

@implementation DKSingleton

+ (void)initialize
{
    if (_sharedInstances == nil)
    {
        _sharedInstances = [NSMutableDictionary dictionary];
    }
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self design];
}

+ (id)copyWithZone:(NSZone *)zone
{
    return [self design];
}

#pragma mark -

+ (instancetype)design
{
    id sharedInstance = nil;

    @synchronized (self)
    {
        NSString *instanceClass = NSStringFromClass(self);

        // Looking for existing instance
        sharedInstance = [_sharedInstances objectForKey:instanceClass];

        // If there's no instance – create one and add it to the dictionary
        if (sharedInstance == nil)
        {
            sharedInstance = [[super allocWithZone:nil] init];
            [_sharedInstances setObject:sharedInstance forKey:instanceClass];
        }
    }

    return sharedInstance;
}

- (id)init
{
    self = [super init];

    if (self && !self.isInitialized)
    {
        _isInitialized = YES;
    }

    return self;
}

@end