//
//  SpriteSlider.m
//  COPA
//
//  Created by Rich Halliday on 2015-04-07.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import "MathUtils.h"
#import "SpriteSlider.h"
#import "SpriteSliderSelector.h"

@interface SpriteSlider ()

@property (nonatomic) SpriteSliderSelector *selector;
@property (nonatomic) SKSpriteNode *bar;

@end

@implementation SpriteSlider

- (id)initWithMin:(double)minValue max:(double)maxValue initial:(double)initialValue sliderBarImageNamed:(NSString *)barImage width:(double)width andSelectorNamed:(NSString *)selectorImage
{
    self = [super init];

    if (self)
    {
        self.bar = [[SKSpriteNode alloc] initWithImageNamed:barImage];
        self.bar.size = CGSizeMake(width, self.bar.size.height);

        self.selector = [[SpriteSliderSelector alloc] initWithImageNamed:selectorImage];
        self.selector.callback = [self spriteSliderCallback];

        self.maxValue = maxValue;
        self.minValue = minValue;
        self.currentValue = initialValue;
        self.zPosition = 1;

        [self addChild:self.bar];
        [self addChild:self.selector];
    }

    return self;
}

- (sliderSelectorCallback)spriteSliderCallback
{
    return ^(SpriteSliderSelector *selector)
    {
        double selectorX = [MathUtils max:selector.position.x :-self.bar.frame.size.width * 0.5f];
        selectorX = [MathUtils min:self.bar.frame.size.width * 0.5f :selectorX];
        selector.position = CGPointMake(selectorX, 0);

        double ratioX = (selectorX + self.bar.frame.size.width / 2) / (self.bar.frame.origin.x + 1.5 * self.bar.frame.size.width);  

        self.currentValue = [MathUtils lerp:self.minValue :self.maxValue :ratioX];
    };
}

- (void)setCurrentValue:(double)newValue
{
    _currentValue = [MathUtils min:self.maxValue :newValue];
    _currentValue = [MathUtils max:self.minValue :_currentValue];

    double ratioX = [MathUtils ilerp:self.minValue :self.maxValue :_currentValue];
    self.selector.position = CGPointMake(-self.bar.frame.size.width / 2 + self.bar.frame.size.width * ratioX, 0);

    if (self.callback)
    {
        self.callback(self);
    }
}

@end
