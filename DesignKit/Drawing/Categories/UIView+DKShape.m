//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <Haystack/Haystack.h>

#import "DKDrawingManager.h"

#import "UIView+DKShape.h"

#import "DKView.h"

@implementation UIView (DKShape)

+ (void)load
{
    //
    // Swizzle the drawRect method to our own
    //

    [self swizzleInstanceMethod:@selector(drawRect:) withMethod:@selector(dk_drawRect:) inClass:[DKView class]];
    //[self swizzleInstanceMethod:@selector(drawRect:) withMethod:@selector(dk_drawRect:) inClass:[UIButton class]];
}

- (void)dk_drawRect:(CGRect)rect
{
    //
    // If we have a drawing block, we will draw it with additional parameters
    //

    DKDrawingBlock dkDrawingBlock = [self drawingBlock];

    if (dkDrawingBlock)
    {
        //
        // Add parameters
        //
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

        parameters[DKDrawingParameterParent] = self;
        parameters[DKDrawingParameterOrientation] = @([[UIApplication sharedApplication] statusBarOrientation]);

        //
        // TODO: Add primary and secondary color to parameters, use motion manager to specify correct orientation
        //

        dkDrawingBlock(rect, parameters);
    }
    else
    {
        // If no drawing block, go default.

    }

    [self dk_drawRect:rect];

}

- (DKDrawingBlock)drawingBlock
{
    return [[DKDrawingManager design] drawingBlockForObject:self];
}

- (void)setDrawingBlock:(DKDrawingBlock)drawingBlock
{
    [[DKDrawingManager design] setDrawingBlock:drawingBlock forObject:self];

    [self setNeedsDisplay];
}


@end