//
//  EntryPoint.m
//  OpenGLTest
//
//  Created by Andre Mesquita on 8/2/12.
//  Copyright (c) 2012 Andre Mesquita. All rights reserved.
//

#import "EntryPoint.h"
#import <OpenGL/gl.h>

#import "Looper.h"

@implementation EntryPoint

Looper *looper;

- (void) drawRect: (NSRect) bounds{    
    looper = [[Looper alloc] init];
    [looper initThis];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:looper selector:@selector(Loop) userInfo:nil repeats:YES];
}

@end
