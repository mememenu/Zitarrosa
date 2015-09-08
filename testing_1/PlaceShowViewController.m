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
#import "PlaceMapViewController.h"
#import "PlaceDetailsViewController.h"
#import "WebViewController.h"
#import "PlaceViewController.h"

#define FOURSQUARE_CLIENT_ID @"SS0D3S2N1I0YMZN2FLT3XF0ZYEPJ4Y00QOJX4HJ1ENZXSN2M"
#define FOURSQUARE_CLIENT_SECRET @"WCX5LXYBW4GMKL0ZDQ2QBTUOVK4E1YXDGHSW4YFQS1DFZSJV"

@interface PlaceShowViewController ()

@property (strong, nonatomic) PlaceMenuTableViewController *placeMenuTVC;
@property (strong, nonatomic) PlacePhotosCollectionViewController *placePhotosCVC;
@property (strong, nonatomic) PlaceMapViewController *placeMapVC;
@property (strong, nonatomic) PlaceDetailsViewController *placeDetailsVC;
@property (strong, nonatomic) WebViewController *webViewController;

@end

@implementation PlaceShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    self.placeMenuTVC = self.childViewControllers.lastObject;
    self.placePhotosCVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Photos"];
    self.placeMapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Map"];
    self.placeDetailsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Details"];
    self.currentVC = self.placeMenuTVC;
    
    [self loadPlace];
    [self locateUser];

}


- (void) loadPlace {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-production.herokuapp.com/api/v1/places/%@.json", self.placeID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.placeDictionary = responseObject;
        [self loadFoursquare];
        [self populateMemeView];
        
        //  Set Menu Data
        self.placeMenuTVC.menusArray = [responseObject objectForKey:@"menus"];
        [self.placeMenuTVC.tableView reloadData];
        
        // Set Photos Data
        self.placePhotosCVC.menusArray = [responseObject objectForKey:@"menus"];
        
        //  Set Map Data
        NSArray *locationArray = [responseObject objectForKey:@"location"];
        self.placeMapVC.placeLocation = [[CLLocation alloc] initWithLatitude:[[locationArray objectAtIndex:0] floatValue]
                                                               longitude:[[locationArray objectAtIndex:1] floatValue]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //  Error Block Here
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
        self.placeDetailsVC.detailsArray = [[self.foursquarePlace objectForKey:@"attributes"] objectForKey:@"groups"];
        [self populateFoursquareView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //  Insert failure block here
    }];
    [operation start];
}

#pragma mark - Populate Views

-(void)populateMemeView {
   
    NSString *imageURL = [_placeDictionary objectForKey:@"logo"];
    //    check place has a banner object present
    if ([_placeDictionary objectForKey:@"banner"] != (id)[NSNull null]) {
        // check if banner has a Cloud Front URL
        if ([[_placeDictionary objectForKey:@"banner"] objectForKey:@"cloudfront_url"] != (id)[NSNull null]) {
            imageURL = [[_placeDictionary objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
            // imageURL = [imageURL stringByReplacingOccurrencesOfString:@"large" withString:@"medium"];
        } else if ([_placeDictionary objectForKey:@"header"] != (id)[NSNull null]) {
            imageURL = [[_placeDictionary objectForKey:@"header"] objectForKey:@"cloudfront_url"];
            // imageURL = [imageURL stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
        }
    }
    
    [self.bannerImageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
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
    self.quoteOneLabel.text = @"'Sample Place Quote One'";
    self.quoteTwoLabel.text = @"'Sample Place Quote Two'";
    self.quoteThreeLabel.text = @"'Sample Place Quote Three'";
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
    self.webViewController.urlString = [[self.foursquarePlace objectForKey:@"reservations"] objectForKey:@"url"];
}

- (IBAction)segmentedControlAction:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
//      Menu Selected
        [self addChildViewController:self.placeMenuTVC];
        [self.placeMenuTVC didMoveToParentViewController:self];
        self.placeMenuTVC.view.frame = self.containerView.bounds;
        [self.containerView addSubview:self.placeMenuTVC.tableView];
        [self.currentVC removeFromParentViewController];
        
    } else if (self.segmentedControl.selectedSegmentIndex == 1) {
//      Photos Selected
        [self addChildViewController:self.placePhotosCVC];
        [self.placePhotosCVC didMoveToParentViewController:self];
        self.placePhotosCVC.view.frame = self.containerView.bounds;
        [self.containerView addSubview:self.placePhotosCVC.collectionView];
        [self.currentVC removeFromParentViewController];
        
    } else if (self.segmentedControl.selectedSegmentIndex == 2) {
//      Maps Selected
        [self addChildViewController:self.placeMapVC];
        [self.placeMapVC didMoveToParentViewController:self];
        self.placeMapVC.view.frame = self.containerView.bounds;
        [self.containerView addSubview:self.placeMapVC.view];
        [self.currentVC removeFromParentViewController];
        
    } else if (self.segmentedControl.selectedSegmentIndex == 3) {
//      Details Selected
        [self addChildViewController:self.placeDetailsVC];
        [self.placeDetailsVC didMoveToParentViewController:self];
        self.placeDetailsVC.view.frame = self.containerView.bounds;
        [self.containerView addSubview:self.placeDetailsVC.view];
        [self.currentVC removeFromParentViewController];
    }
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

- (IBAction)buttonPressed:(id)sender {
    PlaceViewController *placeVC = [[PlaceViewController alloc] init];
    [self presentViewController:placeVC animated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedMenuTableView"]) {
        self.placeMenuTVC = (PlaceMenuTableViewController *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"showWebView"]) {
        self.webViewController = (WebViewController *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"newScreen"]) {
        self.placeMenuTVC = (PlaceMenuTableViewController *)segue.destinationViewController;
    }
}

@end
