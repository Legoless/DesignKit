//
//  UIView+DesignKit.m
//  SampleEffects
//
//  Created by Dal Rupnik on 02/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DesignKit.h"
#import <NUI/UIView+NUI.h>

#import "DKStylesheet.h"

#import <objc/runtime.h>
#import "UIView+DesignKit.h"
#import "DKConstants.h"

@implementation UIView (DesignKit)

- (DKStyle *)style
{
    //
    // Get stylesheet from current stylesheet
    //

    DKStylesheet* stylesheet = [DesignKit design].stylesheet;

    NSString *styleKey = self.styleKey;

    if ([styleKey isEqualToString:DKStyleClassDefault])
    {
        return [stylesheet styleForClass:[self class]];
    }
    else if ([styleKey length])
    {
        return [stylesheet styleForStyleKey:styleKey];
    }

    return nil;
}

- (NSString *)styleKey
{
    NSString * styleKey = objc_getAssociatedObject(self, DKAssociatedStyleKey);

    if (!styleKey)
    {
        return DKStyleClassDefault;
    }

    return styleKey;
}

- (void)setStyleKey:(NSString *)styleKey
{
    if ([styleKey isEqualToString:DKStyleClassNone])
    {
        self.nuiClass = kNUIClassNone;
    }
    else if ([styleKey isEqualToString:DKStyleClassDefault])
    {
        objc_setAssociatedObject(self, DKAssociatedStyleKey, nil, OBJC_ASSOCIATION_RETAIN);
    }
    else
    {
        self.nuiClass = styleKey;

        objc_setAssociatedObject(self, DKAssociatedStyleKey, styleKey, OBJC_ASSOCIATION_RETAIN);
    }

    //
    // Lets redraw the view
    //
    [self setNeedsDisplay];
}

@end
