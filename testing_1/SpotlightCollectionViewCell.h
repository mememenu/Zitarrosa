//
//  SpotlightCollectionViewCell.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/14/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotlightCollectionViewCell : UICollectionViewCell <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *spotlightImageView;
@property (weak, nonatomic) IBOutlet UILabel *spotlightName;
@property (weak, nonatomic) IBOutlet UILabel *spotlightType;

@end
