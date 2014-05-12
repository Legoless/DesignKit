//
// Created by Dal Rupnik on 12/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <NUI/NUISettings.h>

#import "DesignKit.h"

@interface DesignKit ()

@property (nonatomic, strong) NUISettings* nuiSettings;

@end

@implementation DesignKit

+ (void)setup
{
    [self setupWithStyle:nil];
}

+ (void)setupWithStyle:(NSString *)style
{
    [[self design] setupWithStyle:style];
}

- (void)setupWithStyle:(NSString *)style
{
    if ([style length])
    {
        [NUISettings initWithStylesheet:style];
    }
    else
    {
        [NUISettings init];
    }

    NSLog(@"DK: %@", self.nuiSettings.styles);
}

- (NUISettings *)nuiSettings
{
    //
    // Use a small trick to grab the reference to the static NUISettings variable
    //

    if (!_nuiSettings)
    {
        _nuiSettings = [NUISettings performSelector:@selector(getInstance)];
    }

    return _nuiSettings;
}

@end