//
//  UIView+DesignKit.m
//  SampleEffects
//
//  Created by Dal Rupnik on 02/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "UIView+DesignKit.h"

@implementation UIView (DesignKit)

- (DKBlendingOptions *)blendingOptions
{
    DKBlendingOptions* blendingManager = (DKBlendingOptions *)self.superview;
    
    if ([self.superview isKindOfClass:[DKBlendingOptions class]] && blendingManager.targetView == self)
    {
        
    }
    else
    {
        //
        // Create Blending options view and wrap it.
        //
    }
    
    return nil;
}

@end
