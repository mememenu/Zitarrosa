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

@interface PlaceShowViewController ()

@end

@implementation PlaceShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
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
        [self populateView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [operation start];
}


-(void)populateView {
    NSString *image_url = [[self.placeDictionary objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
    [self.bannerImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    self.nameLabel.text = [_placeDictionary objectForKey:@"name"];
    self.cuisineLabel.text = @"Cuisine Label";
    self.openStatusLabel.text = @"Open Status Label";
    self.zoneLabel.text = [_placeDictionary objectForKey:@"zone"];
    
//    Set Distance Label using Core Location
    CLLocation *placeLocation = [[CLLocation alloc] initWithLatitude:[[[_placeDictionary objectForKey:@"location"] objectAtIndex:0] floatValue]
                                                           longitude:[[[_placeDictionary objectForKey:@"location"] objectAtIndex:1] floatValue]];
    CLLocationDistance miles = [placeLocation distanceFromLocation:self.location];
//    1 mile = 1609.344 meters
    self.distanceLabel.text = [NSString stringWithFormat:@"%.1f miles away", (miles/1609.344)];
    
//    Quote Labels
    self.quoteOneLabel.text = @"FMauris convallis bibendum justo eget aucto";
    self.quoteTwoLabel.text = @"Curabitur quis dolor mollis, interdum tellus.";
    self.quoteThreeLabel.text = @"Nullam eu suscipit ligula. Vivamus quis mollis.";
    
    
    self.addressLabel.text = [_placeDictionary objectForKey:@"full_address"];
    self.phoneLabel.text = [_placeDictionary objectForKey:@"formatted_phone"];
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

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
}


@end
