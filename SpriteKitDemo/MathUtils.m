//
//  MathUtils.m
//  COPA
//
//  Created by Rich Halliday on 2015-04-09.
//  Copyright (c) 2015 Factor[e]. All rights reserved.
//

#import "MathUtils.h"

@implementation MathUtils

+ (double)max:(double)x :(double)y
{
    return (x > y) ? x : y;
}

+ (double)min:(double)x :(double)y
{
    return (x > y) ? y : x;
}
+ (double)lerp:(double)a :(double)b :(double)t
{
    return a + (b - a) * t;
}

+ (double)ilerp:(double)a :(double)b :(double)t
{
    return (t - a) / (b - a);
}

@end
