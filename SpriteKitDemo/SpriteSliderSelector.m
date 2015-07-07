//
//  SpriteSliderSelector.m
//  COPA
//
//  Created by Rich Halliday on 2015-04-07.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import "SpriteSliderSelector.h"

@implementation SpriteSliderSelector

- (id)initWithImageNamed:(NSString *)img
{
    self = [super initWithImageNamed:img];
    [self setUserInteractionEnabled:YES];

    return self;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    self.position = touchPoint;

    if (self.callback)
    {
        self.callback(self);
    }
}

@end
