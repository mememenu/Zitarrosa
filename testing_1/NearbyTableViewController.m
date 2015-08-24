//
//  NearbyTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/13/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "NearbyTableViewController.h"
#import "PlacesTableViewCell.h"
#import "SWRevealViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface NearbyTableViewController ()

@end

@implementation NearbyTableViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self locateUser];
     
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.nearbyItems count];
}


- (PlacesTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *place = [self.nearbyItems objectAtIndex: indexPath.row];
    NSString *image_url = [place objectForKey:@"logo"];
    
    if ([place objectForKey:@"banner"] != (id)[NSNull null]) {
        image_url = [[place objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
        image_url = [image_url stringByReplacingOccurrencesOfString:@"large" withString:@"original"];
    }
    
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
//    cell.placeNameLabel.text = [place objectForKey:@"name"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.24;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected %@", [[self.nearbyItems objectAtIndex:indexPath.row] objectForKey:@"name"]);
}

#pragma mark - Core Location Delegate

-(void)locateUser {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self.locationManager startUpdatingLocation];
        self.location = [[CLLocation alloc] init];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = locations.lastObject;
    [self.locationManager stopUpdatingLocation];
    self.latitude = [NSString stringWithFormat:@"%f", self.location.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%f", self.location.coordinate.longitude];
    [self loadNearbyItems];
}

#pragma mark - API Calls

- (void) loadNearbyItems {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://mememenu-development.herokuapp.com/api/v1/places/nearby.json?location[]=%@&location[]=%@&distance=3",_latitude, _longitude]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.nearbyItems = [responseObject objectForKey:@"places"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // insert failure block here
    }];
    
    [operation start];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
