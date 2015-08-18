//
//  HomeTableViewController.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/17/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchBarButtonItem;

@property (nonatomic) NSMutableArray *listItems;


@end
