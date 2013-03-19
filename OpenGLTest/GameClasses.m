//
//  GameClasses.m
//  OpenGLTest
//
//  Created by Andre Mesquita on 3/19/13.
//  Copyright (c) 2013 Andre Mesquita. All rights reserved.
//

#import "GameClasses.h"

@implementation Brick
@synthesize x;
@synthesize y;
@synthesize color;
@synthesize rect;

-(BOOL)collidedWithRect: (CGRect)r{
    return CGRectIntersectsRect(rect, r);
}

@end

@implementation Ball
@synthesize x;
@synthesize y;
@synthesize vX;
@synthesize vY;
@synthesize rect;

- (void)update{
    x += vX;
    y += vY;
    
    if (x < 0 || x + rect.size.width > W) {
        vX *= -1;
    }
    if (y < 0 || y + rect.size.height > H) {
        vY *= -1;
    }
    
    rect.origin.x = x;
    rect.origin.y = y;
}

@end
