//
//  HomeTableViewController.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/17/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpotlightCollectionViewController.h"
#import "FeaturedCollectionViewController.h"

@interface HomeTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarButtonItem;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, readwrite) NSMutableArray *listItems;
@property (nonatomic) float cellHeight;


@end
