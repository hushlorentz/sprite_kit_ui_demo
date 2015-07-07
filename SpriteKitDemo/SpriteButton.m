//
//  SpriteButton.m
//  Blog
//
//  Created by Rich Halliday on 2015-05-28.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import "SpriteButton.h"

@interface SpriteButton ()

@property (nonatomic) BOOL isSelected;
@property (nonatomic, readwrite, strong) SKTexture *unselectedTexture;
@property (nonatomic, readwrite, strong) SKTexture *selectedTexture;

@end

@implementation SpriteButton

- (id)initWithUnselectedImageNamed:(NSString *)unselectedImageName selectedImageNamed:(NSString *)selectedImageName {
    self = [super initWithImageNamed:unselectedImageName];
    
    if (self) {
        self.unselectedTexture = [SKTexture textureWithImageNamed:unselectedImageName];
        self.selectedTexture = [SKTexture textureWithImageNamed:selectedImageName];
        self.isSelected = NO;
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    if (self.isSelected) {
        [self setTexture:self.selectedTexture];
    } else {
        [self setTexture:self.unselectedTexture];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self setIsSelected:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    
    if (CGRectContainsPoint(self.frame, touchPoint)) {
        [self setIsSelected:YES];
    } else {
        [self setIsSelected:NO];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (self.isSelected && self.callback) {
        self.callback();
    }

    [self setIsSelected:NO];
}

@end
