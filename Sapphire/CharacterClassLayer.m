//
//  CharacterClassLayer.m
//  Sapphire
//
//  Created by Aaron Pang on 13-05-06.
//  Copyright 2013 University of Waterloo. All rights reserved.
//

#import "CharacterClassLayer.h"


@implementation CharacterClassLayer
@synthesize className;
@synthesize classImage;
@synthesize classButton;

-(id) initWithProperties : (NSString *) name : (NSString *) imageFilePath {
    if ((self = [super init])){
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // Instantiate the name of the desired class 
        self.className = [CCLabelTTF labelWithString:name fontName:@"Marker Felt" fontSize:36];

        [self.className setPosition: ccp (size.width / 2, size.height * 3/4)];
    
        // Instantiate the image of the desired class
        self.classImage = [CCSprite spriteWithFile: imageFilePath];
        [self.classImage setPosition:ccp(size.width / 2, size.height /2)];
        
        // Instantiate the class button
        self.classButton = [CCMenuItemFont itemWithString:@"GO" block:^(id sender) {
            
        // Comment this out for now until we have a placeholder image for select
//        self.classButton = [CCMenuItemImage itemWithNormalImage:@"" selectedImage:@"" block:^(id sender) {
            // Do something
        }];
        [self.classButton setPosition:ccp (size.width / 2, size.height / 4)];
        
        // Add the Stuff to the parent class to display
        [self addChild: self.className];
        [self addChild: self.classImage];
        [self addChild: self.classButton];
        
    }
    return self;
}

- (void) dealloc {
    [super dealloc];
    [className release];
    [classImage release];
    [classButton release];
}
@end
