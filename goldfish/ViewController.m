//
//  ViewController.m
//  goldfish
//
//  Created by achyut neupane on 10/10/16.
//  Copyright © 2016 achyut neupane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) EAGLContext *context;
@property (nonatomic,strong) GLKBaseEffect *baseEffect;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.context=[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    GLKView *view = (GLKView *)self.view;
    view.context= self.context;
    [EAGLContext setCurrentContext:self.context];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) glkview: (GLKView *) view drawRect:(CGRect) rect
{
    
}

@end
