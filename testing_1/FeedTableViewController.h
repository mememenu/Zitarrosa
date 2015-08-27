//
//  FeedTableViewController.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/21/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (nonatomic, readwrite) NSMutableArray *feedItems;

@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger totalPages;


@end
