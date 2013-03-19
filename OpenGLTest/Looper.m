//
//  Looper.m
//  OpenGLTest
//
//  Created by Andre Mesquita on 3/14/13.
//  Copyright (c) 2013 Andre Mesquita. All rights reserved.
//

#import "Looper.h"
#define PI 3.1415

@implementation Looper

Brick  ***blocks;
Ball    *ball;

float tW(float a){
    return a/(W/2)-1;
}

float tH(float a){
    return 1-a/(H/2);
}

- (void) initThis {
    blocks = malloc(3 * sizeof(Brick***));
    for (int i=0; i<3; i++) {
        blocks[i] = malloc(5*(sizeof(Brick**)));
        for (int j = 0; j<5; j++) {
            blocks[i][j] = [[Brick alloc] init];
            blocks[i][j].color = rand()%3 + 1;
            blocks[i][j].rect = CGRectMake(10 + 130 * j, 10 + 35 * i, 110, 25);
        }
    }
    
    ball = [[Ball alloc] init];
    ball.x = W/2;
    ball.y = H/2;
    ball.vX = 15;
    ball.vY = 10;
    ball.rect = CGRectMake(ball.x, ball.y, 10, 10);
    
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    
    for (int i=0; i<3; i++) {
        for (int j = 0; j<5; j++) {
            if (blocks[i][j]>0) {
                if (blocks[i][j].color == 1 ) glColor3f(1.0f, 0.0f, 0.0f);
                if (blocks[i][j].color == 2 ) glColor3f(0.0f, 1.0f, 0.0f);
                if (blocks[i][j].color == 3 ) glColor3f(0.0f, 0.0f, 1.0f);
                
                [self drawRect:blocks[i][j].rect];
            }
            else {
                glColor3f(1.0f, 1.0f, 1.0f);
                [self drawRect:blocks[i][j].rect];
            }
        }
    }
}

- (void) Loop{
    
    glColor3f(1.0f, 1.0f, 1.0f);
    [self drawRect:ball.rect];
    glColor3f(0.0f, 0.0f, 0.0f);
    [ball update];
    [self drawRect:ball.rect];
    
    for (int i=0; i<3; i++) {
        for (int j = 0; j<5; j++) {
            if ([blocks[i][j] collidedWithRect:ball.rect] && blocks[i][j].color > 0) {
                ball.vY *= -1;
                blocks[i][j].color = -1;
                
                glColor3f(1.0f, 1.0f, 1.0f);
                [self drawRect:blocks[i][j].rect];
            }
        }
    }
    
    glFlush();
}

- (void) drawRect: (CGRect)r{
    float left = r.origin.x;
    float right = r.origin.x + r.size.width;
    float top = r.origin.y;
    float bottom = r.origin.y + r.size.height;
    
    glBegin(GL_TRIANGLES);
    
    glVertex3f( tW(left), tH(top), 0.0);
    glVertex3f( tW(left), tH(bottom), 0.0);
    glVertex3f( tW(right), tH(top), 0.0);
    
    glVertex3f( tW(left), tH(bottom), 0.0);
    glVertex3f( tW(right), tH(bottom), 0.0);
    glVertex3f( tW(right), tH(top), 0.0);
    
    glEnd();
    
}

- (float) getX {
    return 0;
}

@end
