//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <Haystack/Haystack.h>
#import "UIButton+DKShape.h"

#import "DKDrawingManager.h"

@implementation UIButton (DKShape)

+ (void)load
{
    //
    // Swizzle the drawRect method to our own
    //

    [self swizzleInstanceMethod:@selector(drawRect:) withMethod:@selector(dk_drawRect:)];
}

- (void)setDrawingBlock:(DKDrawingBlock)block forState:(UIControlState)state
{
    NSString* drawingState = [NSString stringWithFormat:@"%d", state];

    [[DKDrawingManager design] setDrawingBlocks:@{ drawingState : block } forObject:self];

    [self setNeedsDisplay];
}

- (void)setDrawingBlocks:(NSDictionary *)blocks
{
    [[DKDrawingManager design] setDrawingBlocks:blocks forObject:self];

    [self setNeedsDisplay];
}

- (DKDrawingBlock)drawingBlockForState:(UIControlState)state
{
    NSString* drawingState = [NSString stringWithFormat:@"%d", state];

    NSDictionary *blocks = [[DKDrawingManager design] drawingBlocksForObject:self];

    return blocks[drawingState];
}

- (NSDictionary *)drawingBlocks
{
    return [[DKDrawingManager design] drawingBlocksForObject:self];
}

- (void)dk_drawRect:(CGRect)rect
{
    //
    // If we have a drawing block, we will draw it with additional parameters
    //

    NSDictionary *drawingBlocks = [[DKDrawingManager design] drawingBlocksForObject:self];

    DKDrawingBlock dkDrawingBlock;

    //
    // Find either correct state drawing block or normal
    //

    NSString* state = [NSString stringWithFormat:@"%d", self.state];

    if (drawingBlocks[state])
    {
        dkDrawingBlock = drawingBlocks[state];
    }
    else
    {
        state = [NSString stringWithFormat:@"%d", UIControlStateNormal];

        if (drawingBlocks[state])
        {
            dkDrawingBlock = drawingBlocks[state];
        }
    }

    //
    // If we have drawing block, draw it
    //

    if (dkDrawingBlock)
    {
        NSLog(@"CALLING DRAWING BLOCK!! %@", self);

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
        NSLog(@"DEFAULT DRAW: %@", self);

        // If no drawing block, go default.
        [self dk_drawRect:rect];
    }
}

@end