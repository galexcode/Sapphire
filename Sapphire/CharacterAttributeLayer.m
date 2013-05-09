//
//  CharacterAttributeLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-07.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterAttributeLayer.h"


@implementation CharacterAttributeLayer
@synthesize nameTextField;
@synthesize healthMenu;
@synthesize powerMenu;
@synthesize speedMenu;
@synthesize attributePoints;
@synthesize attributePointsLabel;

static CharacterAttributeLayer* _sharedInstance = nil;

+(CharacterAttributeLayer*) sharedInstance
{
	@synchronized([CharacterAttributeLayer class])
	{
		if (!_sharedInstance)
			[[self alloc] init];
        
		return _sharedInstance;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([CharacterAttributeLayer class])
	{
		NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedInstance = [super alloc];
		return _sharedInstance;
	}
    
	return nil;
}

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
        
        self.healthMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Health" : 0]autorelease];
        self.speedMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Speed" : 0]autorelease];
        self.powerMenu = [[[CharacterAttributeMenu alloc]initWithAttributeType:@"Power" : 0]autorelease];
        
        [self.healthMenu setPosition:ccp (size.width / 2, size.height * 3/4)];
        [self.speedMenu setPosition:ccp (size.width / 2, size.height * 2/4)];
        [self.powerMenu setPosition:ccp (size.width / 2, size.height * 1/4)];
        
        [self addChild:self.speedMenu];
        [self addChild:self.powerMenu];
        [self addChild:self.healthMenu];
    }
    return self;
}
- (void) printSHIT {
    NSLog(@"IOWJDQOIDJJQDWQJD");
}

- (void) dealloc {
    [super dealloc];
    [attributePointsLabel release];
    [speedMenu release];
    [powerMenu release];
    [nameTextField release];
    [healthMenu release];
}
@end
