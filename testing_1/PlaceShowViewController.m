//
//  PlaceShowViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 8/31/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceShowViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import "PlaceMenuTableViewController.h"
#import "PlacePhotosCollectionViewController.h"

#define FOURSQUARE_CLIENT_ID @"SS0D3S2N1I0YMZN2FLT3XF0ZYEPJ4Y00QOJX4HJ1ENZXSN2M"
#define FOURSQUARE_CLIENT_SECRET @"WCX5LXYBW4GMKL0ZDQ2QBTUOVK4E1YXDGHSW4YFQS1DFZSJV"

@interface PlaceShowViewController ()

@property (strong, nonatomic) PlaceMenuTableViewController *placeMenuTVC;
@property (strong, nonatomic) PlacePhotosCollectionViewController *placePhotosCVC;

@end

@implementation PlaceShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.placeMenuTVC = self.childViewControllers.lastObject;
    self.placePhotosCVC = [self.storyboard instantiateViewControllerWithIdentifier:@"placeShowPhotos"];
    self.currentVC = self.placeMenuTVC;
    
    [self loadPlace];
    [self locateUser];

}


- (void) loadPlace {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/places/%@.json", self.placeID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.placeDictionary = responseObject;
        self.placeMenuTVC.menusArray = [responseObject objectForKey:@"menus"];
        self.placePhotosCVC.menusArray = [responseObject objectForKey:@"menus"];
        [_placeMenuTVC.tableView reloadData];
        [self loadFoursquare];
        [self populateMemeView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [operation start];
}

-(void) loadFoursquare {
    NSString *fourSquareId = [self.placeDictionary objectForKey:@"foursquare_id"];
    NSString *url = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@?client_id=%@&client_secret=%@&v=20130815",fourSquareId, FOURSQUARE_CLIENT_ID, FOURSQUARE_CLIENT_SECRET];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.foursquarePlace = [[responseObject objectForKey:@"response"] objectForKey:@"venue"];
        [self populateFoursquareView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //  Insert failure block here
    }];
    [operation start];
}

#pragma mark - Populate Views

-(void)populateMemeView {
    NSString *image_url = [[self.placeDictionary objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
    [self.bannerImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    self.nameLabel.text = [_placeDictionary objectForKey:@"name"];
    self.zoneLabel.text = [_placeDictionary objectForKey:@"zone"];
    self.addressLabel.text = [_placeDictionary objectForKey:@"full_address"];
    [self.phoneButton setTitle:[_placeDictionary objectForKey:@"formatted_phone"] forState:UIControlStateNormal];
    
//    Set Distance Label using Core Location
    CLLocation *placeLocation = [[CLLocation alloc] initWithLatitude:[[[_placeDictionary objectForKey:@"location"] objectAtIndex:0] floatValue]
                                                           longitude:[[[_placeDictionary objectForKey:@"location"] objectAtIndex:1] floatValue]];
    CLLocationDistance miles = [placeLocation distanceFromLocation:self.location];
//    1 mile = 1609.344 meters
    self.distanceLabel.text = [NSString stringWithFormat:@"%.1f miles away", (miles/1609.344)];
    
//    Quote Labels
    self.quoteOneLabel.text = @"'FMauris convallis bibendum justo eget aucto'";
    self.quoteTwoLabel.text = @"'Curabitur quis dolor mollis, interdum tellus'";
    self.quoteThreeLabel.text = @"'Nullam eu suscipit ligula. Vivamus quis mollis'";
    
}


-(void) populateFoursquareView {
    self.cuisineLabel.text = [[[self.foursquarePlace objectForKey:@"categories"] objectAtIndex:0] objectForKey:@"shortName"];
    self.openStatusLabel.text = [[self.foursquarePlace objectForKey:@"hours"] objectForKey:@"status"];
    
    if ([self.foursquarePlace objectForKey:@"reservations" ] != NULL) {
        [self.reserveButton setEnabled:YES];
    }
}

#pragma mark - Status Bar Style

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Core Location Delegate

-(void)locateUser {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self.locationManager startUpdatingLocation];
        self.location = [[CLLocation alloc] init];
    } else {
        UIAlertView* noLocationAlert=[[UIAlertView alloc] initWithTitle:@"This app does not have access to Location service" message:@"You can enable access in Settings to view nearby Places"
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Settings", nil];
        noLocationAlert.tag=121;
        [noLocationAlert show];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = locations.lastObject;
    [self.locationManager stopUpdatingLocation];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 121 && buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

#pragma mark - IB Actions

- (IBAction) callButtonPress:(id)sender {
//    modify to use meme number instead of foursquare number
    NSString *phNo = [[self.foursquarePlace objectForKey:@"contact"] objectForKey:@"phone"];
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    }
}

- (IBAction)reservationButtonPressed:(id)sender {
    NSLog(@"%@", [self.foursquarePlace objectForKey:@"reservations"]);
}

- (IBAction)segmentedControlAction:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        
        if (self.currentVC != self.placeMenuTVC) {
            [self addChildViewController:self.placeMenuTVC];
            self.placeMenuTVC.view.frame = self.containerView.bounds;
            [self moveToNewController:self.placeMenuTVC];
        }
        
    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
        
        if (self.currentVC != self.placePhotosCVC) {
            [self addChildViewController:self.placePhotosCVC];
            self.placePhotosCVC.view.frame = self.containerView.bounds;
            [self moveToNewController:self.placePhotosCVC];
        }
        
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
        NSLog(@"Map");
    } else if (self.segmentedControl.selectedSegmentIndex == 3) {
        NSLog(@"Details");
    }
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - Navigation

-(void)moveToNewController:(UIViewController *) newController {
    [self.currentVC willMoveToParentViewController:nil];
    [self transitionFromViewController:self.currentVC toViewController:newController duration:.6 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil
                            completion:^(BOOL finished) {
                                [self.currentVC removeFromParentViewController];
                                [newController didMoveToParentViewController:self];
                                self.currentVC = newController;
                            }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedMenuTableView"]) {
        self.placeMenuTVC = (PlaceMenuTableViewController *)segue.destinationViewController;
    }
}

@end
