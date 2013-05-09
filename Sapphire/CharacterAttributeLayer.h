//
//  CharacterAttributeLayer.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-07.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterAttributeMenu.h"

@interface CharacterAttributeLayer : CCLayer {
    UITextField *nameTextField;
    CharacterAttributeMenu *healthMenu;
    CharacterAttributeMenu *speedMenu;
    CharacterAttributeMenu *powerMenu;
    NSInteger attributePoints;
    CCLabelTTF *attributePointsLabel;
}

@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) CharacterAttributeMenu *healthMenu;
@property (nonatomic, retain) CharacterAttributeMenu *speedMenu;
@property (nonatomic, retain) CharacterAttributeMenu *powerMenu;
@property (nonatomic, assign) NSInteger attributePoints;
@property (nonatomic, retain) CCLabelTTF *attributePointsLabel;

+(CCScene *) scene;
+(CharacterAttributeLayer *) sharedInstance;
- (void) printSHIT;
@end
