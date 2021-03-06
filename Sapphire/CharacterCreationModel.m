//
//  CharacterCreationModel.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-08.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterCreationModel.h"


@implementation CharacterCreationModel
@synthesize health;
@synthesize speed;
@synthesize power;
@synthesize characterClass;
@synthesize attributePoints;
@synthesize playerName;

static CharacterCreationModel* _sharedInstance = nil;

+(CharacterCreationModel*) sharedInstance
{
	@synchronized([CharacterCreationModel class])
	{
		if (!_sharedInstance)
			[[self alloc] init];
        
		return _sharedInstance;
	}
    
	return nil;
}

+(id)alloc
{
	@synchronized([CharacterCreationModel class])
	{
		NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedInstance = [super alloc];
		return _sharedInstance;
	}
    
	return nil;
}

- (void) dealloc {
    [super dealloc];
    [characterClass release];
    [playerName release];
}

@end
