//
//  SpotlightItem.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/18/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpotlightItem : NSObject


@property (nonatomic, copy) NSString *spotlightType;
@property (nonatomic, copy) NSString *spotlightName;
@property (nonatomic, copy) NSURL *avatarURL;

-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
