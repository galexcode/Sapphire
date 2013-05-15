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
#import "CharacterCreationModel.h"

@interface CharacterAttributeLayer : CCLayer <UIAlertViewDelegate> {
    UITextField *nameTextField;
    CharacterAttributeMenu *healthMenu;
    CharacterAttributeMenu *speedMenu;
    CharacterAttributeMenu *powerMenu;
    NSInteger attributePoints;
    CCLabelTTF *attributePointsLabel;
    CCMenuItem *nextButton;
    CCMenuItem *backButton;
}

@property (nonatomic, retain) UITextField *nameTextField;
@property (nonatomic, retain) CharacterAttributeMenu *healthMenu;
@property (nonatomic, retain) CharacterAttributeMenu *speedMenu;
@property (nonatomic, retain) CharacterAttributeMenu *powerMenu;
@property (nonatomic, assign) NSInteger attributePoints;
@property (nonatomic, retain) CCLabelTTF *attributePointsLabel;
@property (nonatomic, retain) CCMenuItem *nextButton;
@property (nonatomic, retain) CCMenuItem *backButton;

+(CCScene *) scene;
+ (CCScene *) modelScene;
- (void) updateAttributePointsLabel : (NSInteger) increment;

@end
