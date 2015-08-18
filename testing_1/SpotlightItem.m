//
//  SpotlightItem.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/18/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "SpotlightItem.h"

@implementation SpotlightItem

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.spotlightName = [[dictionary objectForKey:@"spotable"] objectForKey:@"name"];
        self.spotlightType = [[dictionary objectForKey:@"spotable"] objectForKey:@"type"];
        self.avatarURL = [NSURL URLWithString:[dictionary objectForKey:@"image_url"]];
    }
    return self;
}

@end
