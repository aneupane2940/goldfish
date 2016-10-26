//
//  Sprite.m
//  goldfish
//
//  Created by achyut neupane on 10/14/16.
//  Copyright © 2016 achyut neupane. All rights reserved.
//

#import "Sprite.h"

@interface Sprite()
@property (nonatomic, weak) GLKBaseEffect *baseEffect;
@end
@implementation Sprite

-(id) initwithEffect:(GLKBaseEffect *)baseEffect
{
    if((self == [super init])){
        self.baseEffect= baseEffect;
    }
    return self;
}

-(void) update
{
    
}

-(void) render
{
    glClear(GL_COLOR_BUFFER_BIT);
    
    self.baseEffect.texture2d0.name = self.textureInfo.name;
    self.baseEffect.texture2d0.target = self.textureInfo.target;
    
    GLKMatrix4 modelviewMatrix =
    GLKMatrix4Translate(GLKMatrix4Identity , self.position.x -SQUARE_SIZE /2,
                        self.position.y -SQUARE_SIZE /2 , 0);
    
    modelviewMatrix = GLKMatrix4Rotate
    (modelviewMatrix, GLKMathDegreesToRadians(self.rotation),
     
     0.0f, 0.0f, 1.0f);
    
    self.baseEffect.transform.modelviewMatrix =
    modelviewMatrix;
    
    
    [self.baseEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}
@end
