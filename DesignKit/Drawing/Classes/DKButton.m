//
// Created by Dal Rupnik on 02/05/14.
// Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKButton.h"

@implementation DKButton

- (void)drawRect:(CGRect)rect
{
}

- (void)setSelected:(BOOL)selected
{
    [self setNeedsDisplay];
    [super setSelected:selected];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [self setNeedsDisplay];
    [super setHighlighted:highlighted];
}

@end