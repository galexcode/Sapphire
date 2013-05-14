//
//  CharacterClassLayer.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-06.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterCreationModel.h"

@interface CharacterClassLayer : CCLayer {
    CCLabelTTF *className;
    CCMenuItem *classButton;
    CCSprite *classImage;
}

@property (nonatomic, retain) CCLabelTTF *className;
@property (nonatomic, retain) CCMenuItem *classButton;
@property (nonatomic, retain) CCSprite *classImage;

-(id) initWithProperties : (NSString *) name : (NSInteger) attributePoints;
@end
