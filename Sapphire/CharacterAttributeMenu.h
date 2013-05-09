//
//  CharacterAttributeMenu.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-07.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CharacterAttributeMenu : CCMenu {
    CCMenuItemLabel* minusButton;
    CCMenuItemLabel* attributeType;
    CCMenuItemLabel* plusButton;
    CCMenuItemLabel* valueLabel;
    
    NSInteger attributeValue;
}

@property (nonatomic,assign) NSInteger attributeValue;
@property (nonatomic,retain) CCMenuItemLabel* minusButton;
@property (nonatomic,retain) CCMenuItemLabel* attributeType;
@property (nonatomic,retain) CCMenuItemLabel* plusButton;
@property (nonatomic,retain) CCMenuItemLabel* valueLabel;

- (id) initWithAttributeType : (NSString *) attribute :(NSInteger) defaultValue;
@end
