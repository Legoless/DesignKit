//
// Created by Dal Rupnik on 14/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKDrawingDefines.h"
#import "DKDrawingSource.h"

//
// TODO: This category.
//
@interface UIView (DKDrawing)

/*!
 * Only a wrapper for primary color for drawing
 */
@property (nonatomic, strong) UIColor* drawingColor;

/*!
 * Only a wrapper for secondary color for drawing
 */
@property (nonatomic, strong) UIColor* drawingSecondaryColor;

/*!
 * Only a wrapper for drawing tag property in the style
 */
@property (nonatomic, strong) DKDrawingSourceTag* drawingTag;

/*!
 * If a drawing tag is set, the drawing source is also set.
 */
@property (nonatomic, readonly) DKDrawingSource* drawingSource;

- (void)setDrawingTag:(DKDrawingSourceTag *)drawingTag withSource:(DKDrawingSource *)drawingSource;

@end