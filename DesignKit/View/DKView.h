//
//  DKView.h
//  SampleEffects
//
//  Created by Dal Rupnik on 25/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 * An extendable subclass of UIView
 */
@interface DKView : UIView

/*!
 * Do not call this method directly, this is a method that should be overriden by subclasses
 */
- (void)setup;

@end
