//
//  UIView+DesignKit.h
//  SampleEffects
//
//  Created by Dal Rupnik on 02/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

#import <NUI/NUIConstants.h>
#import "DKStyle.h"

@interface UIView (DesignKit)

/*!
 * Access to style for the current UIView. Style can be manipulated directly, but the changes
 * are reflected globally on all objects that use this style.
 *
 * Style is nil when no style was set in the stylesheet (or stylesheet is not prepared)
 * When style is specifically set as DKStyleClassNone
 */
@property (nonatomic, readonly) DKStyle* style;

/*!
 * Get or set the style key. Do not attempt to change the style property of the class,
 * as it will break the rendering system.
 *
 * - Use DKStyleClassDefault for the default class (depending on the view class)
 * - Use DKStyleClassNone for no rendering - ability to set all properties of the view/layer manually
 */
@property (nonatomic, strong) NSString* styleKey;

@end
