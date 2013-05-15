//
//  CharacterCreationLayer.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-05.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCScrollLayer.h"

@interface CharacterCreationLayer : CCLayer <UITextFieldDelegate> {
    CCScrollLayer *scrollLayer;
    CCMenuItemLabel *backButton;
}

@property (nonatomic, retain) CCScrollLayer *scrollLayer;
@property (nonatomic, retain) CCMenuItemLabel *backButton;

+(CCScene *) scene;
- (NSArray *) createCharacterClassArray;

extern NSString* const ATTRIBUTE_POINTS;
extern NSString* const PLIST_NAME;
@end
