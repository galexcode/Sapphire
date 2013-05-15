//
//  CharacterConfirmationLayer.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-12.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CharacterConfirmationLayer : CCLayer  <UITextFieldDelegate>{
    CCSprite *characterClassSprite;
    CCLabelTTF *characterClassLabel;
    CCLabelTTF *healthLabel;
    CCLabelTTF *speedLabel;
    CCLabelTTF *powerLabel;
    UITextField *nameTextField;
    CCLabelTTF *nameLabel;
    CCMenuItemLabel *startButton;
    CCMenuItemLabel *backButton;
}

@property (nonatomic,retain) CCSprite *characterClassSprite;
@property (nonatomic,retain) CCLabelTTF *characterClassLabel;
@property (nonatomic,retain) CCLabelTTF *healthLabel;
@property (nonatomic,retain) CCLabelTTF *speedLabel;
@property (nonatomic,retain) CCLabelTTF *powerLabel;
@property (nonatomic,retain) UITextField *nameTextField;
@property (nonatomic,retain) CCLabelTTF *nameLabel;
@property (nonatomic,retain) CCMenuItemLabel *startButton;
@property (nonatomic,retain) CCMenuItemLabel *backButton;

+(CCScene *) scene;

@end
