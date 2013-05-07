//
//  CharacterCreationLayer.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-05.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CharacterCreationLayer : CCLayer <UITextFieldDelegate> {
    
}
+(CCScene *) scene;
//- (UITextField *) createCharacterCreationTextField : (int) x : (int) y : (int) width : (int) height;
- (NSArray *) createCharacterClassArray;
@end
