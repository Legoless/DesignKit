//
// Created by Dal Rupnik on 13/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <Haystack/Haystack.h>
#import "UIButton+DKShape.h"
#import "DKDrawingSource.h"


@implementation UIButton (DKShape)
@end

@interface DKShapeButton ()

@property (nonatomic, strong) NSMutableDictionary* stateBlocks;

/*!
 * This is a state variable that locks the control from calling self setNeedsDisplay.
 * Helps as performance is improved when setDrawingTag is called.
 */
@property (nonatomic, getter = isDrawingDisabled) BOOL drawingDisabled;

/*!
 * Store drawing source for performance improvements
 */
@property (nonatomic, readwrite) DKDrawingSource* drawingSource;

@end

@implementation DKShapeButton

- (void)setNeedsDisplay
{
    if (self.isDrawingDisabled)
    {
        return;
    }

    [super setNeedsDisplay];
}

- (void)setNeedsDisplayInRect:(CGRect)rect
{
    if (self.isDrawingDisabled)
    {
        return;
    }

    [super setNeedsDisplayInRect:rect];
}

- (void)setDrawingShape:(DKDrawingTag *)drawingShape
{
    //
    // If there is no drawing source we already send nil
    //
    [self setDrawingShape:drawingShape withSource:self.drawingSource];
}

- (void)setDrawingShape:(DKDrawingTag *)drawingShape withSource:(DKDrawingSource *)drawingSource
{
    //
    // If there is no drawing source, we will find the source that has the drawing tag
    //

    if (!drawingSource)
    {
        drawingSource = [DKDrawingSource sourceForTag:drawingShape];
    }

    // Save the drawing source, we will use it later for switching the tags
    self.drawingSource = drawingSource;

    if (!self.drawingSource)
    {
        // Remove the drawing tag, because we do not have it in a source.
        _drawingShape = nil;

        return;
    }

    _drawingShape = drawingShape;

    //
    // Reset state blocks
    //

    [self.stateBlocks removeAllObjects];

    //
    // Queue correct drawing source for all states of drawing tag
    //

    self.drawingDisabled = YES;

    [self setDrawingBlock:[drawingSource drawingBlockForTag:drawingShape forState:UIControlStateNormal] forState:UIControlStateNormal];
    [self setDrawingBlock:[drawingSource drawingBlockForTag:drawingShape forState:UIControlStateDisabled] forState:UIControlStateDisabled];
    [self setDrawingBlock:[drawingSource drawingBlockForTag:drawingShape forState:UIControlStateSelected] forState:UIControlStateSelected];
    [self setDrawingBlock:[drawingSource drawingBlockForTag:drawingShape forState:UIControlStateHighlighted] forState:UIControlStateHighlighted];

    self.drawingDisabled = NO;

    //
    // Redraw the content with new drawing blocks
    //

    [self setNeedsDisplay];
}

- (NSMutableDictionary *)stateBlocks
{
    if (!_stateBlocks)
    {
        _stateBlocks = [NSMutableDictionary dictionary];
    }

    return _stateBlocks;
}


- (void)drawRect:(CGRect)rect
{
    //
    // Call correct drawing block for current state
    //

    NSString* controlState = [NSString stringWithFormat:@"%d", self.state];

    //NSLog(controlState);

    if (self.stateBlocks[controlState])
    {
        DKDrawingBlock drawingBlock = self.stateBlocks[controlState];

        drawingBlock(rect);

        return;
    }

    //
    // Draw default state block, if we have it
    //

    controlState = [NSString stringWithFormat:@"%d", UIControlStateNormal];

    if (self.stateBlocks[controlState])
    {
        DKDrawingBlock drawingBlock = self.stateBlocks[controlState];

        drawingBlock(rect);
    }
}

- (void)setDrawingBlock:(DKDrawingBlock)block forState:(UIControlState)state
{
    //
    // Protect self against empty blocks
    //

    if (!block)
    {
        return;
    }

    NSString* controlState = [NSString stringWithFormat:@"%d", state];

    self.stateBlocks[controlState] = block;

    //
    // Redraw the button with new drawing block
    //
    [self setNeedsDisplay];
}

- (DKDrawingBlock)drawingBlockForState:(UIControlState)state
{
    NSString* controlState = [NSString stringWithFormat:@"%d", state];

    if (self.stateBlocks[controlState])
    {
        return self.stateBlocks[controlState];
    }

    return nil;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];

    [self setNeedsDisplay];
}