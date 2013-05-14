//
//  CharacterAttributeMenu.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-07.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterAttributeMenu.h"
#import "CharacterAttributeLayer.h"

@implementation CharacterAttributeMenu
@synthesize minusButton;
@synthesize attributeType;
@synthesize plusButton;
@synthesize attributeValue;
@synthesize valueLabel;

- (id) initWithAttributeType : (NSString *) attribute :(NSInteger) defaultValue :(CharacterAttributeLayer *) layer{
    if ((self = [super init])){
        self.attributeValue = defaultValue;
        self.minusButton = [CCMenuItemFont itemWithString:@"-" block:^(id sender) {
            // Only increment the attribute points if there is value to decrement
            if (self.attributeValue > 0) {
                self.attributeValue-= 1;
                [((CCMenuItemFont*) self.valueLabel) setString:[NSString stringWithFormat:(@"%d"),self.attributeValue]];
                [layer updateAttributePointsLabel:1];
            }
        }];
        self.plusButton = [CCMenuItemFont itemWithString:@"+" block:^(id sender) {
            // Only decrement the attribute points if the attribute points are greater than 0
            if ([layer attributePoints] > 0){
                self.attributeValue += 1;
                [((CCMenuItemFont*) self.valueLabel) setString:[NSString stringWithFormat:(@"%d"),self.attributeValue]];
                [layer updateAttributePointsLabel:-1];
            }

        }];
        self.attributeType = [CCMenuItemFont itemWithString:attribute];
        self.valueLabel = [CCMenuItemFont itemWithString:[NSString stringWithFormat:(@"%d"),self.attributeValue]];
       
        [self.attributeType setIsEnabled:NO];
        [self.valueLabel setIsEnabled:NO];
        
        [self.valueLabel setColor:ccGREEN];
        
        [self addChild:self.minusButton];
        [self addChild:self.attributeType];
        [self addChild:self.plusButton];
        [self addChild:valueLabel];
        
        [self.minusButton setScale:2.5];
        [self.plusButton setScale:2.5];
      
        
//        [self.valueLabel setAnchorPoint:ccp(-3,0.5)];
          [self.valueLabel setPosition: ccp(self.valueLabel.contentSize.width * 0.5, self.valueLabel.contentSize.height * 0.5)];
        

        [self alignItemsHorizontallyWithPadding:90];
        
    }
    return self;
}

- (void) dealloc {
    [super dealloc];
    [minusButton release];
    [attributeType release];
    [plusButton release];
    [valueLabel release];
}
@end
