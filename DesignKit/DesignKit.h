//
// Created by Dal Rupnik on 12/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKDefines.h"
#import "DKProperties.h"
#import "UIView+DesignKit.h"

#import "DKStyle.h"
#import "DKStylesheet.h"

#import "DKSingleton.h"

#import "DKBlendingOptions.h"
#import "DKSmartFilters.h"


@interface DesignKit : DKSingleton

@property (nonatomic, strong) DKStylesheet* stylesheet;

+ (void)setup;

+ (void)setupWithStylesheetPath:(NSString *)path;

+ (void)setupWithStylesheet:(DKStylesheet *)stylesheet;

@end