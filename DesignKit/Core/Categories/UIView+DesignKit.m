//
// Created by Dal Rupnik on 18/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <SVGKit/SVGKit.h>

#import "DKProperties.h"

#import "UIView+DesignKit.h"
#import "UIView+DKStyle.h"
#import "UIView+DKShape.h"

@implementation UIView (DesignKit)

- (void)dk_apply
{
    //
    // Apparently this is called before it is loaded?
    //
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

            // Should redraw the UIView
            //[self setNeedsDisplay];
        }
        else if (self.viewStyle[DKPropertyVectorShape])
        {
            DKDrawingVectorShape* vectorShape = self.viewStyle[DKPropertyVectorShape];

            //
            // Create SVG shape
            //

            [self setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
            {
                SVGKImage* image = [SVGKImage imageNamed:vectorShape];

                [image drawInRect:rect];
            }];
        }
    }
}

- (void)dk_didMoveToWindow
{
    [self dk_apply];

    [self dk_didMoveToWindow];
}


@end