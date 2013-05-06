//
//  CharacterCreationLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-05.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterCreationLayer.h"
#import "CCScrollLayer.h"

@implementation CharacterCreationLayer 
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
        UITextField *nameTextField = [[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 200)]autorelease];
        [nameTextField setBackgroundColor:[UIColor whiteColor]];
        [nameTextField setBorderStyle: UITextBorderStyleRoundedRect];
        [nameTextField setDelegate:self];
//        [[[CCDirector sharedDirector] view]addSubview:nameTextField];
        CCLayer *layer = [[[CCLayer alloc]init]autorelease];
        CCLabelTTF *nameLabel = [[[CCLabelTTF alloc]initWithString:@"Name" fontName:@"Marker Felt" fontSize:30]autorelease];
        [nameLabel setPosition:ccp(size.width / 2, size.height / 2)];
        
        CCLayer *layer2 = [[[CCLayer alloc]init]autorelease];
        CCLabelTTF *nameLabel2 = [[[CCLabelTTF alloc]initWithString:@"Name" fontName:@"Marker Felt" fontSize:30]autorelease];
        [layer2 addChild:nameLabel2];
        
        [layer addChild:nameLabel];
        NSArray *arrayOfLayers = [NSArray arrayWithObjects:layer,layer2, nil];
        CCScrollLayer *scrollLayer = [[[CCScrollLayer alloc]initWithLayers:arrayOfLayers widthOffset:0]autorelease];
        [self addChild:scrollLayer];
    }
    return self;
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}
@end
