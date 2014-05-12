//
// Created by Dal Rupnik on 12/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKSingleton.h"

@interface DesignKit : DKSingleton

/*!
 * Wrapper styles for
 */
@property (nonatomic, readonly) NSDictionary* styles;

+ (void)setup;

+ (void)setupWithStyle:(NSString *)style;

@end