//
//  MathUtils.h
//  COPA
//
//  Created by Rich Halliday on 2015-04-09.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathUtils : NSObject
 
+ (double)max:(double)x :(double)y;
+ (double)min:(double)x :(double)y;
+ (double)lerp:(double)a :(double)b :(double)t;
+ (double)ilerp:(double)a :(double)b :(double)t;

@end
