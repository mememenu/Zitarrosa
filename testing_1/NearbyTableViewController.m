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
    self.nearbyItems = [[NSMutableArray alloc] init];
    self.distanceFilter = 5;
    [self locateUser];
     
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.tableView.tableHeaderView = self.distanceHeaderView;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(locateUser)
                  forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.nearbyItems count] > 0) {
        self.tableView.tableHeaderView.hidden = NO;
        return 1;
    } else {
        self.tableView.tableHeaderView.hidden = YES;
        [self setErrorMessage];
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.nearbyItems count];
}


- (PlacesTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
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
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://mememenu-development.herokuapp.com/api/v1/places/nearby.json?location[]=%@&location[]=%@&distance=%i",_latitude, _longitude, _distanceFilter]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.nearbyItems = [responseObject objectForKey:@"places"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.nearbyItems = nil;
//        uncomment the line below to remove results if connection is lost during use
//        [self.tableView reloadData];
    }];
    
    [self.refreshControl endRefreshing];
    [operation start];
}

#pragma mark - IB Actions

- (IBAction)didChangeDistance:(id)sender {
    UIButton* distancebutton = (UIButton*)sender;
    self.distanceFilter = [distancebutton.titleLabel.text intValue];
    [self loadNearbyItems];
}

#pragma mark - Rescue View

-(void)setErrorMessage {
    // Display a message when the table is empty
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    messageLabel.text = @"No data is currently available. Please pull down to refresh.";
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
    [messageLabel sizeToFit];
    
    self.tableView.backgroundView = messageLabel;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView.hidden = YES;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
