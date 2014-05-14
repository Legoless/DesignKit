//
// Created by Dal Rupnik on 06/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKDefines.h"

#import "DKSingleton.h"

@interface DKDrawingSource : DKSingleton

/*!
 * Registers drawing source with the system, called automatically by load system.
 * This operation is thread-safe.
 */
+ (void)registerSource:(Class)class;

/*!
 * Returns all registered icon sources (classes that contain developer-defined drawing blocks).
 */
+ (NSArray *)allSources;

/*!
 * Returns singleton of icon source
 */
+ (instancetype)source;

/*!
 * Returns first source that contains drawing
 */
+ (DKDrawingSource *)sourceForTag:(DKDrawingSourceTag *)tag;

/*!
 * Returns YES if a drawing block for the tag exists - any tag.
 */
- (BOOL)containsDrawingBlockForTag:(DKDrawingSourceTag *)tag;

/*!
 * Returns YES if the specific drawing block for tag exists
 */
- (BOOL)containsDrawingBlockForTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state;

/*!
 * Returns the drawing block for tag
 */
- (DKDrawingBlock)drawingBlockForTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state;

/*!
 * Adds new drawing block.
 */
- (void)setDrawingBlock:(DKDrawingBlock)drawingBlock forTag:(DKDrawingSourceTag *)tag forState:(UIControlState)state;

/*!
 * DO NOT CALL THIS METHOD DIRECTLY, SHOULD ONLY BE USED WHEN SUBCLASSING (CREATING NEW SOURCE)
 */
- (void)setupBlocks;

@end