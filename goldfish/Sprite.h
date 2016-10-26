//
//  Sprite.h
//  goldfish
//
//  Created by achyut neupane on 10/14/16.
//  Copyright © 2016 achyut neupane. All rights reserved.
//

#ifndef Sprite_h
#define Sprite_h


#endif /* Sprite_h */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

#define SQUARE_SIZE 80

@interface Sprite : NSObject

- (id)initwithEffect:(GLKBaseEffect *)baseEffect;


@property (nonatomic,strong) GLKTextureInfo *
textureInfo;
@property (assign) GLKVector2 position;
@property (assign) float rotation;

-(void) render;
-(void) update;

@end
