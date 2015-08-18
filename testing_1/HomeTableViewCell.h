//
//  HomeTableViewCell.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/17/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *listName;
@property (weak, nonatomic) IBOutlet UILabel *listType;

@end
