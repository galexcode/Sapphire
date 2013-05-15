//
//  CharacterCreationLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-05.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "MainMenuLayer.h"
#import "CharacterCreationLayer.h"
#import "CharacterClassLayer.h"
#import "CCScrollLayer.h"
#import "CCTextField.h"
#import "CCLabelTTF.h"

NSString* const ATTRIBUTE_POINTS = @"Attribute Points";
NSString* const PLIST_NAME = @"CharacterCreationStaticData";

@implementation CharacterCreationLayer
@synthesize scrollLayer;
@synthesize backButton;

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CharacterCreationLayer *layer = [CharacterCreationLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init {
    if ((self = [super init])){
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        NSArray *arrayOfClassLayers = [self createCharacterClassArray];
        
        self.scrollLayer = [[[CCScrollLayer alloc]initWithLayers:arrayOfClassLayers widthOffset:0]autorelease];
        self.backButton = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainMenuLayer scene]]];
        }];
        CCMenu *backButtonMenu = [CCMenu menuWithItems:self.backButton, nil];
        [backButtonMenu setPosition:ccp (size.width * 1/8, size.height * 9/10)];
        
        [self addChild:backButtonMenu];
        [self addChild:scrollLayer];
    }
    return self;
}

- (NSArray *) createCharacterClassArray {
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:PLIST_NAME ofType:@"plist"];
    NSDictionary *characterClassDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    NSMutableArray *arrayOfLayers = [NSMutableArray array];
    for (NSString* key in characterClassDictionary){
        NSInteger attributePoints = [[[characterClassDictionary objectForKey:key] objectForKey:ATTRIBUTE_POINTS]intValue];
        CharacterClassLayer *layer = [[[CharacterClassLayer alloc]initWithProperties
            :key
            :attributePoints]autorelease];
        [arrayOfLayers addObject:layer];
    }

    return arrayOfLayers;
}



-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

- (void) dealloc {
    [super dealloc];
    [scrollLayer release];
}
@end
