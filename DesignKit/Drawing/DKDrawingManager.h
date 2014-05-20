//
// Created by Dal Rupnik on 18/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKSingleton.h"
#import "DKDrawingDefines.h"
#import "DKDrawingConstants.h"

/*!
 * Holds drawing block pointers for specific objects
 */
@interface DKDrawingManager : DKSingleton

/*!
 * Return block associated for object - if there are more assigned, the first one is returned
 */
- (DKDrawingBlock)drawingBlockForObject:(id)object;

/*!
 * Returns all blocks associated for object
 */
- (NSDictionary *)drawingBlocksForObject:(id)object;

/*!
 * Sets drawing block for specific object
 */
- (void)setDrawingBlock:(DKDrawingBlock)drawingBlock forObject:(id)object;

/*!
 * Sets a dictionary of drawing blocks for specific object
 */
- (void)setDrawingBlocks:(NSDictionary *)drawingBlocks forObject:(id)object;

@end