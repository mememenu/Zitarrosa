//
//  CollectionsTableViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 8/31/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;

@property (nonatomic) NSMutableArray *collections;

@end
