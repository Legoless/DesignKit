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
#import "UIButton+DKShape.h"

@interface DKSandboxViewController ()
@property (weak, nonatomic) IBOutlet UIButton *topLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *topRightButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightButton;

@end

@implementation DKSandboxViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.topLeftButton.styleKey = @"DesignKitButton";

    [self.topRightButton setDrawingBlock:^(CGRect rect, NSDictionary *parameters)
    {
        NSLog(@"DRWAAAAWW: %@", NSStringFromCGRect(rect));

        [[UIColor redColor] setFill];

        UIBezierPath * bezierPath = [UIBezierPath bezierPathWithOvalInRect:rect];

        [bezierPath fill];
    } forState:UIControlStateNormal];

    [self.bottomLeftButton.viewStyle setPropertyForKey:DKPropertyFontColor withProperty:@"#FF0000"];

    //[self.bottomRightButton.viewStyle setPropertyForKey:DKPropertyBackgroundColor withProperty:@"#FF0000"];
    //[self.bottomRightButton.viewStyle setPropertyForKey:DKPropertyFontColor withProperty:@"#FFFFFF"];
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
