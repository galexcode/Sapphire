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

- (id) initWithAttributeType : (NSString *) attribute :(NSInteger) defaultValue {
    if ((self = [super init])){
        self.attributeValue = defaultValue;
        self.minusButton = [CCMenuItemFont itemWithString:@"-" block:^(id sender) {
            // Minus some shit
            self.attributeValue = self.attributeValue <= 0 ? 0 : self.attributeValue - 1;
            [((CCMenuItemFont*) self.valueLabel) setString:[NSString stringWithFormat:(@"%d"),self.attributeValue]];
            [[CharacterAttributeLayer sharedInstance] printSHIT];
            
        }];
        self.plusButton = [CCMenuItemFont itemWithString:@"+" block:^(id sender) {
            self.attributeValue++;
            [((CCMenuItemFont*) self.valueLabel) setString:[NSString stringWithFormat:(@"%d"),self.attributeValue]];
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
        [self.valueLabel setAnchorPoint:ccp(-3,0.5)];
        

        [self alignItemsHorizontally];
        
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
