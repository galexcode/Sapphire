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
    NSString *characterClass;
    
}
+(CharacterCreationModel *) sharedInstance;

@end
