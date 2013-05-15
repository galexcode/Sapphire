//
//  CharacterConfirmationLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-12.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterConfirmationLayer.h"
#import "CharacterCreationModel.h"
#import "CharacterAttributeLayer.h"

@implementation CharacterConfirmationLayer

@synthesize characterClassSprite;
@synthesize characterClassLabel;
@synthesize healthLabel;
@synthesize speedLabel;
@synthesize powerLabel;
@synthesize nameTextField;
@synthesize nameLabel;
@synthesize startButton;
@synthesize backButton;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	CharacterConfirmationLayer *layer = [CharacterConfirmationLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}
- (id) init {
    if ((self = [super init])){
        CGSize size = [[CCDirector sharedDirector] winSize];

        NSInteger health = [[CharacterCreationModel sharedInstance] health];
        NSInteger speed = [[CharacterCreationModel sharedInstance] speed];
        NSInteger power = [[CharacterCreationModel sharedInstance] power];
        NSString *characterClass = [[CharacterCreationModel sharedInstance] characterClass];
        
        self.characterClassSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@.png",characterClass]];
        self.characterClassLabel = [CCLabelTTF labelWithString:characterClass fontName:@"Marker Felt" fontSize:30];
        self.healthLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Health: %d",health] fontName:@"Marker Felt" fontSize:20];
        self.speedLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Speed: %d",speed] fontName:@"Marker Felt" fontSize:20];
        self.powerLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Power: %d",power] fontName:@"Marker Felt" fontSize:20];
        self.nameLabel = [CCLabelTTF labelWithString:@"Name: " fontName:@"Marker Felt" fontSize:20];

        self.nameTextField = [[[UITextField alloc]initWithFrame:CGRectMake(size.width * 2/3, size.height * 1/8, 140, 30)]autorelease];
        [self.nameTextField setBackgroundColor:[UIColor whiteColor]];
        [self.nameTextField setBorderStyle:UITextBorderStyleRoundedRect];
        [self.nameTextField setDelegate:self];
        [self.nameTextField setReturnKeyType:UIReturnKeyDone];
        
        self.backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
            // Code
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[CharacterAttributeLayer modelScene]]];
            [self.nameTextField removeFromSuperview];
        }];
        
        self.startButton = [CCMenuItemFont itemWithString:@"Start" block:^(id sender) {
            // Play the Game!
            [self.nameTextField removeFromSuperview];

        }];
        [self.startButton setColor:ccGREEN];
        
        CCMenu *startMenu = [CCMenu menuWithItems:startButton, nil];
        CCMenu *backMenu = [CCMenu menuWithItems:backButton, nil];
        
        [backMenu setPosition:ccp (size.width * 1 /8, size.height  * 9 / 10)];
        [self.characterClassSprite setPosition:ccp (size.width * 1/4, size.height * 2/3)];
        [self.characterClassLabel setPosition:ccp (size.width * 1/4, size.height * 1/3 )];
        
        [self.nameLabel setPosition:ccp(size.width * 3/5, size.height * 5/6)];
        [self.healthLabel setPosition:ccp (size.width * 3/4, size.height * 4/6)];
        [self.speedLabel setPosition:ccp (size.width * 3/4, size.height * 3/6)];
        [self.powerLabel setPosition:ccp (size.width * 3/4, size.height * 2/6)];
        [startMenu setPosition:ccp (size.width * 1/2, size.height * 1/8)];
        
        
        [self addChild:self.characterClassSprite];
        [self addChild:self.characterClassLabel];
        [self addChild:self.healthLabel];
        [self addChild:self.speedLabel];
        [self addChild:self.powerLabel];
        [self addChild:self.nameLabel];
        [self addChild:startMenu];
        [self addChild:backMenu];
        [[[CCDirector sharedDirector] view] addSubview:self.nameTextField];
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameTextField resignFirstResponder];
    return NO;
}

- (void) dealloc {
    [super dealloc];
    [characterClassSprite release];
    [characterClassLabel release];
    [healthLabel release];
    [speedLabel release];
    [powerLabel release];
    [nameTextField release];
    [nameLabel release];
    [startButton release];
    [backButton release];
}
@end
