//
//  CharacterCreationLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-05.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterCreationLayer.h"
#import "CharacterClassLayer.h"
#import "CCScrollLayer.h"
#import "CCTextField.h"
#import "CCLabelTTF.h"

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
        
//        CCLayer *layer = [[[CCLayer alloc]init]autorelease];
//        CCLabelTTF *nameLabel = [[[CCLabelTTF alloc]initWithString:@"Name" fontName:@"Marker Felt" fontSize:30]autorelease];
//        [nameLabel setPosition:ccp(size.width / 2, size.height / 2)];
//        
//        CCLayer *layer2 = [[[CCLayer alloc]init]autorelease];
//        CCLabelTTF *nameLabel2 = [[[CCLabelTTF alloc]initWithString:@"Name" fontName:@"Marker Felt" fontSize:30]autorelease];
//        
//        [layer2 addChild:nameLabel2];
//        [layer addChild:nameLabel];
//        NSArray *arrayOfLayers = [NSArray arrayWithObjects:layer,layer2, nil];

        NSArray *arrayOfClassLayers = [self createCharacterClassArray];
        
        CCScrollLayer *scrollLayer = [[[CCScrollLayer alloc]initWithLayers:arrayOfClassLayers widthOffset:0]autorelease];
        [self addChild:scrollLayer];
        [scrollLayer setIsTouchEnabled:YES];
    }
    return self;
}

- (NSArray *) createCharacterClassArray {
    CharacterClassLayer *layer1 = [[[CharacterClassLayer alloc]initWithProperties: @"Soldier" : @"Soldier.png"] autorelease];
    CharacterClassLayer *layer2 = [[[CharacterClassLayer alloc]initWithProperties: @"Rogue" : @"Rogue.png"] autorelease];
    CharacterClassLayer *layer3 = [[[CharacterClassLayer alloc]initWithProperties:@"Brute" :@"Brute.png"]autorelease];
    NSArray *arrayOfLayers = [NSArray arrayWithObjects:layer1,layer2,layer3, nil];
    return arrayOfLayers;
}

///** 
// *  Creates a new UITextfield with white background and rounded edges for use in the character creation layer
// **/
//- (UITextField *) createCharacterCreationTextField : (int) x : (int) y : (int) width : (int) height{
//    UITextField *newTextField = [[UITextField alloc]initWithFrame:CGRectMake(x, y, width, height)];
//    [newTextField setBackgroundColor:[UIColor whiteColor]];
//    [newTextField setBorderStyle: UITextBorderStyleRoundedRect];
//    [newTextField setDelegate:self];
//    return newTextField;
//}



-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

- (void) dealloc {
    [super dealloc];
}
@end
