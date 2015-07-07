//
//  SpriteSliderSelector.h
//  COPA
//
//  Created by Rich Halliday on 2015-04-07.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpriteSliderSelector : SKSpriteNode

typedef void (^sliderSelectorCallback)(SpriteSliderSelector *);
@property (nonatomic, copy) sliderSelectorCallback callback;

@end
