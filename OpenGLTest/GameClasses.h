//
//  GameClasses.h
//  OpenGLTest
//
//  Created by Andre Mesquita on 3/19/13.
//  Copyright (c) 2013 Andre Mesquita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OpenGL/OpenGL.h>

#define W 650
#define H 650

#define BRICK_W     120
#define BRICK_H     25

@interface Brick: NSObject{
    float x;
    float y;
    int color;
    CGRect rect;
}

-(BOOL)collidedWithRect: (CGRect)r;

@property float x;
@property float y;
@property int color;
@property CGRect rect;

@end

@interface Ball: NSObject{
    float x;
    float y;
    float vX;
    float vY;
    CGRect rect;
}

- (void)update;

@property float x;
@property float y;
@property float vX;
@property float vY;
@property CGRect rect;

@end

@interface Bar: NSObject

@end