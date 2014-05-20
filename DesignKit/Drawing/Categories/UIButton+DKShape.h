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

/*!
 * Returns specific drawing block for state
 */
- (DKDrawingBlock)drawingBlockForState:(UIControlState)state;

/*!
 * This is called by DesignKit when setting drawing blocks from either SVGKit or DrawingSource
 */
- (void)setDrawingBlocks:(NSDictionary *)blocks;

/*!
 * Returns a read only dictionary of drawing blocks
 */
- (NSDictionary *)drawingBlocks;

@end