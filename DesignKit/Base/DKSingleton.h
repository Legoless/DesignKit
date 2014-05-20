//
// Created by Dal Rupnik on 06/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

/*!
 * A DesignKit specific, subclassable singleton object. Code based on DOSingleton
 */
@interface DKSingleton : NSObject

@property (assign, readonly) BOOL isInitialized;

+ (instancetype)design;

@end