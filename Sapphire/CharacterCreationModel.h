//
//  CharacterCreationModel.h
//  Sapphire
//
//  Created by Aaron Pang on 13-05-08.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CharacterCreationModel : CCNode {
    NSInteger health;
    NSInteger speed;
    NSInteger power;
    NSInteger attributePoints;
    NSString *characterClass;
    
}
+(CharacterCreationModel *) sharedInstance;
@property (nonatomic, assign) NSInteger health;
@property (nonatomic, assign) NSInteger speed;
@property (nonatomic, assign) NSInteger power;
@property (nonatomic, assign) NSInteger attributePoints;
@property (nonatomic, retain) NSString *characterClass;
@end
