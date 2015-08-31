//
//  NearbyViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 8/25/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface NearbyViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *sortTopView;
@property (weak, nonatomic) IBOutlet UIView *sortBottomView;
@property (weak, nonatomic) IBOutlet UILabel *placesCountLabel;

@property (weak, nonatomic) IBOutlet UIButton *distanceButton1;
@property (weak, nonatomic) IBOutlet UIButton *distanceButton2;
@property (weak, nonatomic) IBOutlet UIButton *distanceButton3;


@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic) UIRefreshControl *refreshControl;
@property (nonatomic) NSMutableArray *nearbyItems;

@property (nonatomic) int distanceFilter;

@end
