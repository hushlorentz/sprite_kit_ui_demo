//
//  SpriteButton.h
//  Blog
//
//  Created by Rich Halliday on 2015-05-28.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SpriteButton : SKSpriteNode

@property (nonatomic, copy) void (^callback)();

- (id)initWithUnselectedImageNamed:(NSString *)unselectedImageName selectedImageNamed:(NSString *)selectedImageNamed;

@end