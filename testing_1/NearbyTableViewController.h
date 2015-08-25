//
//  NearbyTableViewController.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/13/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface NearbyTableViewController : UITableViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;


@property (nonatomic) NSMutableArray *nearbyItems;
@property (nonatomic) int distanceFilter;

@property (weak, nonatomic) IBOutlet UIView *distanceHeaderView;

@end
