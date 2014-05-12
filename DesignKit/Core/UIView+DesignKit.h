//
//  UIView+DesignKit.h
//  SampleEffects
//
//  Created by Dal Rupnik on 02/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKBlendingOptions.h"
#import "DKSmartFilters.h"

@interface UIView (DesignKit)

@property (nonatomic, readonly) DKBlendingOptions* blendingOptions;
@property (nonatomic, readonly) DKSmartFilters* smartFilters;

- (void)setup;

@end
