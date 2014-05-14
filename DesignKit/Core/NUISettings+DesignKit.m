//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "NUISettings+DesignKit.h"


@implementation NUISettings (DesignKit)

+ (NUISettings *)defaultSettings
{
    if ([NUISettings respondsToSelector:@selector(getInstance)])
    {
        return [NUISettings performSelector:@selector(getInstance)];
    }

    return nil;
}
@end