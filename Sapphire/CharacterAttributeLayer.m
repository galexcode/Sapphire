//
//  CharacterAttributeLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-07.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterAttributeLayer.h"
#import "CharacterCreationLayer.h"


@implementation CharacterAttributeLayer
@synthesize nameTextField;
@synthesize healthMenu;
@synthesize powerMenu;
@synthesize speedMenu;
@synthesize attributePoints;
@synthesize attributePointsLabel;
@synthesize backButton;
@synthesize nextButton;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
        
	// 'layer' is an autorelease object.
	CharacterAttributeLayer *layer = [CharacterAttributeLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


- (id) init {
    if ((self = [super init])){
        CGSize size = [[CCDirector sharedDirector] winSize];
        NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"CharacterCreationStaticData" ofType:@"plist"];
        NSDictionary *characterClassDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        for (NSString* key in characterClassDictionary){
        }
        self.healthMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Health" : 0 : self]autorelease];
        self.speedMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Speed" : 0 : self]autorelease];
        self.powerMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Power" : 0 : self]autorelease];
        
        self.attributePoints = [[CharacterCreationModel sharedInstance] attributePoints];
        self.attributePointsLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Attribute Points Left: %d",self.attributePoints] fontName:@"Marker Felt" fontSize:30];
        [self.attributePointsLabel setPosition:ccp (size.width / 2, size.height * 4/5)];
        
        [self.healthMenu setPosition:ccp (size.width / 2, size.height * 3/5)];
        [self.speedMenu setPosition:ccp (size.width / 2, size.height * 2/5)];
        [self.powerMenu setPosition:ccp (size.width / 2, size.height * 1/5)];
        
        self.nextButton = [CCMenuItemFont itemWithString:@"Next" block:^(id sender) {
            if (self.attributePoints > 0) {
                UIAlertView *attributePointsAlert = [[[UIAlertView alloc]initWithTitle:@"Leftover Points" message:@" You haven't used up all your attribute points! \n Are you sure you want to continue?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil] autorelease];
                [attributePointsAlert show];
            }
            else {
                [self continueToNextScene];
            }
        }];
        self.backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[CharacterCreationLayer scene]]];
        }];
        
        CCMenu *navigationMenu =[CCMenu menuWithItems:self.backButton,self.nextButton, nil];
        [navigationMenu setPosition:ccp (size.width / 2, size.height * 9 / 10)];
        [navigationMenu alignItemsHorizontallyWithPadding:size.width * 2 / 3];
        
        [self addChild:navigationMenu];
        [self addChild:self.attributePointsLabel];
        [self addChild:self.speedMenu];
        [self addChild:self.powerMenu];
        [self addChild:self.healthMenu];
    }
    return self;
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1){
        [self continueToNextScene];
    }
}
- (void) continueToNextScene {
    // Save the information into the model
    [[CharacterCreationModel sharedInstance] setHealth:self.healthMenu.attributeValue];
    [[CharacterCreationModel sharedInstance] setSpeed:self.speedMenu.attributeValue];
    [[CharacterCreationModel sharedInstance] setPower:self.powerMenu.attributeValue];
}
- (void) updateAttributePointsLabel : (NSInteger) increment {
    self.attributePoints += increment;
    [self.attributePointsLabel setString: [NSString stringWithFormat:@"Attribute Points Left: %d",self.attributePoints]];
}

- (void) dealloc {
    [super dealloc];
    [attributePointsLabel release];
    [speedMenu release];
    [powerMenu release];
    [nameTextField release];
    [healthMenu release];
    [nextButton release];
    [backButton release];
}
@end
