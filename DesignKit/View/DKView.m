//
//  DKView.m
//  SampleEffects
//
//  Created by Dal Rupnik on 25/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKView.h"

@interface DKView ()

@property (nonatomic, getter = isSetuped) BOOL setuped;

@end

@implementation DKView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    
}

@end
