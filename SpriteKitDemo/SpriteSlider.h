//
//  SpriteSlider.h
//  COPA
//
//  Created by Rich Halliday on 2015-04-07.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpriteSlider : SKNode

- (id)initWithMin:(double)minValue max:(double)maxValue initial:(double)initialValue sliderBarImageNamed:(NSString *)barImage width:(double)width andSelectorNamed:(NSString *)selectorImage;

@property (nonatomic) double minValue;
@property (nonatomic) double maxValue;
@property (nonatomic) double currentValue;

typedef void (^SliderCallback)(SpriteSlider *);
@property (nonatomic, copy) SliderCallback callback;

@end
