//
//  GameScene.m
//  Blog
//
//  Created by Rich Halliday on 2015-05-28.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import "GameScene.h"
#import "SpriteButton.h"
#import "SpriteSlider.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view
{
    SpriteButton *helloButton = [[SpriteButton alloc] initWithUnselectedImageNamed:@"hello_button" selectedImageNamed:@"hello_button_selected"];
    helloButton.callback = [self foo];
    helloButton.position = CGPointMake(self.view.frame.size.width / 2, 0.33 * self.view.frame.size.height);
    helloButton.zPosition = 1;
   
    [self addChild:helloButton];

    SpriteSlider *slider = [[SpriteSlider alloc] initWithMin: 0 max: 100 initial: 50 sliderBarImageNamed:@"slider_bar" width: self.view.frame.size.width - 50 andSelectorNamed:@"slider_selector"];
    slider.position = CGPointMake(self.view.frame.size.width / 2 + slider.frame.size.width, 0.66 * self.view.frame.size.height);
    slider.callback = [self bar];
    
    [self addChild:slider];
}

- (void(^)())foo
{
    return ^(){ NSLog(@"Hello, World!"); };
}

- (SliderCallback)bar
{
    return ^(SpriteSlider *slider)
    {
        NSLog(@"Current Value: %f", slider.currentValue);
    };
}

@end
