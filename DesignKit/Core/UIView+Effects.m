//
//  UIView+Effects.m
//  EffectKit
//
//  Created by Dal Rupnik on 13/03/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "UIView+Effects.h"
#import "DRBlendingView.h"

@implementation UIView (Effects)

- (DRBlendingOptions *)blendingOptions
{
    //
    // Return new blending options
    //
    
    if ([self.superview isKindOfClass:[DRBlendingView class]])
    {
        return ((DRBlendingView *)self.superview).blendingOptions;
    }
    else
    {
        //
        // Transfer view to blending options
        //
        
        DRBlendingView* blendingLayer = [[DRBlendingView alloc] initWithFrame:self.frame];
        
        UIView* superview = self.superview;
        
        //
        // Sort constraints
        //
        
        NSArray* constraints = self.constraints;
        
        [self removeConstraints:constraints];
        
        [blendingLayer addConstraints:constraints];
        
        //
        // Sort out masks
        //
        
        blendingLayer.autoresizingMask = self.autoresizingMask;
        
        [self removeFromSuperview];
        
        self.frame = self.bounds;
        
        [blendingLayer addSubview:self];
        
        [superview addSubview:blendingLayer];
        
    }
    
    return nil;
}

@end
