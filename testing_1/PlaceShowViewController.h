//
//  PlaceShowViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 8/31/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PlaceShowViewController : UIViewController <CLLocationManagerDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *openStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *cuisineLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *zoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *quoteOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *quoteTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *quoteThreeLabel;

@property (weak, nonatomic) IBOutlet UIButton *addressButton;

@property (weak, nonatomic) IBOutlet UIButton *phoneButton;
@property (weak, nonatomic) IBOutlet UIButton *reserveButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic) NSString *placeID;
@property (nonatomic) NSDictionary *placeDictionary;
@property (nonatomic) NSDictionary *foursquarePlace;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (nonatomic) UIViewController *currentVC;

- (IBAction)segmentedControlAction:(id)sender;

@end
