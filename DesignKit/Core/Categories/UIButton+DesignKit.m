//
// Created by Dal Rupnik on 18/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <SVGKit/SVGKit.h>

#import "UIButton+NUI.h"

#import "UIView+DKStyle.h"

#import "UIView+DKShape.h"

#import "UIButton+DesignKit.h"
#import "DKProperties.h"
#import "DKDrawingDefines.h"
#import "DKDrawingSource.h"
#import "DKButton.h"

@implementation UIButton (DesignKit)

- (void)dk_apply
{
    //
    // This handles to have DKButton's subclass same default class as it's superclass
    //
    if ([self isMemberOfClass:[DKButton class]] && self.nuiClass == nil)
    {
        self.nuiClass = @"Button";
        [self applyNUI];
    }

    if ([self respondsToSelector:@selector(viewStyle)])
    {
        //
        // If there is a drawing tag
        //
        if (self.viewStyle[DKPropertyDrawingTag])
        {
            DKDrawingSourceTag* sourceTag = self.viewStyle[DKPropertyDrawingTag];

            //
            // Just set drawing blocks, from drawing source
            //

            DKDrawingSource *drawingSource = [DKDrawingSource sourceForTag:sourceTag];

            [self setDrawingBlock:[drawingSource drawingBlockForTag:sourceTag forState:UIControlStateNormal]];
            [self setDrawingBlock:[drawingSource drawingBlockForTag:sourceTag forState:UIControlStateDisabled]];
            [self setDrawingBlock:[drawingSource drawingBlockForTag:sourceTag forState:UIControlStateHighlighted]];
            [self setDrawingBlock:[drawingSource drawingBlockForTag:sourceTag forState:UIControlStateSelected]];

            // Should redraw the UIView
            //[self setNeedsDisplay];
        }
        else if (self.viewStyle[DKPropertyVectorShape])
        {
            [self addVectorImageBlockForState:UIControlStateNormal];
            [self addVectorImageBlockForState:UIControlStateDisabled];
            [self addVectorImageBlockForState:UIControlStateHighlighted];
            [self addVectorImageBlockForState:UIControlStateSelected];

            [self setNeedsDisplay];
        }
    }
}

- (void)addVectorImageBlockForState:(UIControlState)state
{
    DKDrawingVectorShape* vectorShape = [self.viewStyle propertyForKey:DKPropertyVectorShape forState:state];

    if (![vectorShape length])
    {
        return;
    }

    [self setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
    {
        SVGKImage* image = [SVGKImage imageNamed:vectorShape];

        [image drawInRect:rect];
    } forState:state];
}
@end