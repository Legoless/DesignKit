//
//  DKSandboxViewController.m
//  Demo
//
//  Created by Dal Rupnik on 18/05/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import "DKSandboxViewController.h"
#import "UIView+DKStyle.h"
#import "DKProperties.h"

#import "UIView+DKShape.h"
#import "UIButton+DKShape.h"
#import "UIView+NUI.h"
#import "DKConstants.h"

@interface DKSandboxViewController ()

@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (weak, nonatomic) IBOutlet UIView *middleView;

@end

@implementation DKSandboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.topLeftButton.styleKey = @"DesignKitButton";
    self.topRightButton.styleKey = @"DesignKitButton";

    [self.topRightButton setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
    {
        [[UIColor redColor] setFill];

        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:4.0];

        [bezierPath fill];
    } forState:UIControlStateNormal];

    [self.topRightButton setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
    {
        [[UIColor blueColor] setFill];

        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0.0];

        [bezierPath fill];
    } forState:UIControlStateHighlighted];

    [self.topRightButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];

    [self.bottomLeftButton.viewStyle setProperty:@"#FF0000" forKey:DKPropertyFontColor];

    //[self.bottomRightButton.viewStyle setPropertyForKey:DKPropertyBackgroundColor withProperty:@"#FF0000"];
    //[self.bottomRightButton.viewStyle setPropertyForKey:DKPropertyFontColor withProperty:@"#FFFFFF"];

    [self.middleView setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
    {
        [[UIColor redColor] setFill];
        
        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [bezierPath fill];
    }];
}

- (IBAction)barButtonTap:(UIBarButtonItem *)sender
{
}

- (IBAction)topLeftButtonTap:(UIButton *)sender
{
}

- (IBAction)topRightButtonTap:(UIButton *)sender
{
}

- (IBAction)bottomLeftButtonTap:(UIButton *)sender
{
}

- (IBAction)bottomRightButtonTap:(UIButton *)sender
{
}

@end
