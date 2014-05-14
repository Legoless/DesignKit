//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKDrawingDefines.h"

@interface UIButton (DKShape)

/*!
 * Sets a specific drawing block and overwrites set by a tag
 */
- (void)setDrawingBlock:(DKDrawingBlock)block forState:(UIControlState)state;
- (DKDrawingBlock)drawingBlockForState:(UIControlState)state;


@end