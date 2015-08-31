//
//  NearbyViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 8/25/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "NearbyViewController.h"
#import "PlacesTableViewCell.h"
#import "SWRevealViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface NearbyViewController ()

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sortBottomView.hidden = YES;
    self.nearbyItems = [[NSMutableArray alloc] init];
    self.distanceFilter = 3;
    self.distanceButton2.selected = YES;
    
    [self locateUser];
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(locateUser)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

#pragma mark - Table view data source

//  test out performance differences with and without this method
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    if ([self.nearbyItems count] > 0) {
//        return 1;
//    }
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.nearbyItems count];
}

- (PlacesTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *place = [self.nearbyItems objectAtIndex: indexPath.row];
    NSString *image_url = [place objectForKey:@"logo"];
    
    //    check place has a banner object present
    if ([place objectForKey:@"banner"] != (id)[NSNull null]) {
        image_url = [[place objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
        image_url = [image_url stringByReplacingOccurrencesOfString:@"large" withString:@"original"];
    }
    //    !!!!!!!!replace with proper placeholder!!!!!!
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    cell.placeNameLabel.text = [place objectForKey:@"name"];
    
    float distance = [[place objectForKey:@"distance"] floatValue];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%.1f miles away",distance];
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
    
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self.locationManager startUpdatingLocation];
        self.location = [[CLLocation alloc] init];
    } else {
        UIAlertView* noLocationAlert=[[UIAlertView alloc] initWithTitle:@"This app does not have access to Location service" message:@"You can enable access in Settings to view nearby Places"
                                                               delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Settings", nil];
        noLocationAlert.tag=121;
        [noLocationAlert show];
        [self.refreshControl endRefreshing];
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    self.location = locations.lastObject;
    [self.locationManager stopUpdatingLocation];
    self.latitude = [NSString stringWithFormat:@"%f", self.location.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%f", self.location.coordinate.longitude];
    [self loadNearbyItems];
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"did change authorization status");
}

#pragma mark - API Calls

- (void) loadNearbyItems {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://mememenu-development.herokuapp.com/api/v1/places/nearby.json?location[]=%@&location[]=%@&distance=%i",_latitude, _longitude, _distanceFilter]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.nearbyItems = [responseObject objectForKey:@"places"];
        self.sortBottomView.hidden = NO;
        self.tableView.backgroundView.hidden = YES;
        self.placesCountLabel.text = [NSString stringWithFormat:@"%lu Places", (unsigned long)[self.nearbyItems count]];
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self setErrorMessage];
        self.nearbyItems = nil;
        self.sortBottomView.hidden = YES;
        [self.tableView reloadData];
        [self.refreshControl endRefreshing];
    }];
    [operation start];
}

#pragma mark - IB Actions
- (IBAction)sortButtonPressed:(id)sender {
    //    left off here trying to hide bottom view and move tableview up
    //    self.sortBottomView.hidden ^= YES;
    //    self.sortBottomView.hidden = !self.sortBottomView.hidden;
}

- (IBAction)didChangeDistance:(id)sender {
    UIButton* distancebutton = (UIButton*)sender;
    // Unselect all the buttons in the parent view
    for (UIView *button in distancebutton.superview.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [(UIButton *)button setSelected:NO];
        }
    }
    //    set distance button selected and distance filter to button title text
    [distancebutton setSelected:YES];
    self.distanceFilter = [distancebutton.titleLabel.text intValue];
    [self loadNearbyItems];
}

#pragma mark - Error Messages

-(void)setErrorMessage {
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (self.view.bounds.size.width - 10), self.view.bounds.size.height)];
    
    messageLabel.text = @"No data is currently available. Please pull down to refresh.";
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
    [messageLabel sizeToFit];
    
    self.tableView.backgroundView = messageLabel;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 121 && buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
