//
//  PlacesViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 8/28/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite) NSMutableArray *placeItems;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *placesCountLabel;

@end
