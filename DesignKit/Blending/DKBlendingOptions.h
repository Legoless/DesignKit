//
//  DKBlendingOptions.h
//  SampleEffects
//
//  Created by Dal Rupnik on 02/04/14.
//  Copyright (c) 2014 arvystate.net. All rights reserved.
//

@protocol DKBlendingOption <NSObject>


@end

@interface DKBlendingOptions : NSObject

@property (nonatomic, strong) UIView* targetView;

@property (nonatomic, strong) UIView<DKBlendingOption>* colorOverlay;

@end
