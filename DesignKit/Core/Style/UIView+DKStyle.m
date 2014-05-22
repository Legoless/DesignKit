//
// Created by Dal Rupnik on 18/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+DKStyle.h"
#import "UIView+NUI.h"
#import "DKStyle.h"
#import "DKStylesheet.h"
#import "DesignKit.h"
#import "DKConstants.h"
#import "NUIConstants.h"

@implementation UIView (DKStyle)

- (DKStyle *)viewStyle
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
        self.nuiClass = [[NSStringFromClass([self class]) stringByReplacingOccurrencesOfString:@"UI" withString:@""] stringByReplacingOccurrencesOfString:@"DK" withString:@""];

        objc_setAssociatedObject(self, DKAssociatedStyleKey, nil, OBJC_ASSOCIATION_RETAIN);
    }
    else
    {
        self.nuiClass = styleKey;

        objc_setAssociatedObject(self, DKAssociatedStyleKey, styleKey, OBJC_ASSOCIATION_RETAIN);
    }

    [self applyNUI];
    [self dk_apply];

    //
    // Lets redraw the view
    //
    [self setNeedsDisplay];
}

@end