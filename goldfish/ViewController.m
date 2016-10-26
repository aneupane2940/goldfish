//
//  ViewController.m
//  goldfish
//
//  Created by achyut neupane on 10/10/16.
//  Copyright © 2016 achyut neupane. All rights reserved.
//

#import "ViewController.h"

typedef struct {
    GLKVector3 positionCoordinates;
} VertexData;

VertexData vertices [] ={
    {-0.5f , -0.5f, 0.0f},
    {0.5f , -0.5f, 0.0f},
    {-0.5f , 0.5f, 0.0f},
    {-0.5f , 0.5f, 0.0f},
    {-0.5f , -0.5f, 0.0f},
    {-0.5f , 0.5f, 0.0f},
    
};


@interface ViewController ()
@property (nonatomic,strong) EAGLContext *context;
@property (nonatomic,strong) GLKBaseEffect *baseEffect;


@end

@implementation ViewController {
    GLuint _vertexBuferID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.context=[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView *view = (GLKView *)self.view;
    view.context= self.context;
    [EAGLContext setCurrentContext:self.context];
    
    self.baseEffect =[[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = YES;
    self.baseEffect.constantColor = GLKVector4Make(1.0f, 0.0f, 0.0f, 1.0f);
    
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glGenBuffers(1, &_vertexBuferID);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT,GL_FALSE,sizeof(VertexData),
                              NULL);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) glkview: (GLKView *) view drawRect:(CGRect) rect
{
    glClear(GL_COLOR_BUFFER_BIT );
    [self.baseEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}

-(void) update
{
    
}

@end
