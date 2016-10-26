//
//  ViewController.m
//  goldfish
//
//  Created by achyut neupane on 10/10/16.
//  Copyright © 2016 achyut neupane. All rights reserved.
//

#import "ViewController.h"
#import "Sprite.h"


typedef struct{
    GLKVector3 positionCoordinates;
    GLKVector2 textureCoordinates;
}VertexData;


VertexData vertices [] = {
    {{0.0f , 0.0f , 0.0f },{0.0f , 0.0f }},
    {{SQUARE_SIZE ,0.0f , 0.0f }, { 1.0f , 0.0f }},
    {{0.0f , SQUARE_SIZE , 0.0f },  { 0.0f , 1.0f }},
    {{0.0f , SQUARE_SIZE, 0.0f },  { 0.0f , 1.0f }},
    {{SQUARE_SIZE  ,0.0f , 0.0f },  { 1.0f , 0.0f }},
    {{SQUARE_SIZE  ,SQUARE_SIZE, 0.0f },  { 1.0f , 1.0f }}
    
};


@interface ViewController ()
@property (nonatomic,strong) EAGLContext *context;
@property (nonatomic,strong) GLKBaseEffect *baseEffect;
@property (nonatomic , strong) Sprite *rabbit;
@property (assign) GLKVector2 position;

@end

@implementation ViewController {
    
    GLuint _vertexBufferID;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.context=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView *view = (GLKView *)self.view;
    view.context=self.context;
    [EAGLContext setCurrentContext:self.context];
    
    self.baseEffect =[[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor =YES;
    //self.baseEffect.constantColor=
    //GLKVector4Make(1.0f, 0.0f, 1.0f, 1.0f);
    
    self.baseEffect.transform.projectionMatrix =
    GLKMatrix4MakeOrtho(0,640,0,1136, 0, 0);
    
    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);
    glGenBuffers(1, &_vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices) ,
                 vertices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT,
                          GL_FALSE, sizeof(VertexData),
                          offsetof(VertexData,
                                   positionCoordinates));
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT,
                          GL_FALSE,
                          sizeof(VertexData),
                          (GLvoid *) offsetof(VertexData,
                                              textureCoordinates));
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(changeLocation:)];
    
    
    CGImageRef imageReference = [[UIImage imageNamed:@"rocket.png"] CGImage];
    GLKTextureInfo *textureInfo =
    [GLKTextureLoader textureWithCGImage:imageReference
                                 options:[NSDictionary
                                          dictionaryWithObject:
                                          [NSNumber numberWithBool:YES]
                                          forKey:GLKTextureLoaderOriginBottomLeft ]
                                   error:NULL];
    
    self.rabbit = [[Sprite alloc] initwithEffect:
                      self.baseEffect];
    self.rabbit.textureInfo = textureInfo;
    self.rabbit.position = GLKVector2Make(400,300);
    //self.rabbit.rotation= 90;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.rabbit render];
}

-(void) changeLocation:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"test");
}

-(void) update
{
    [self.rabbit update];
}

@end
