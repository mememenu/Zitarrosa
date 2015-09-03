//
//  HomeTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/17/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "SWRevealViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import "PlacesViewController.h"
 
@interface HomeTableViewController ()

@property (strong, nonatomic) SpotlightCollectionViewController *spotlightCVC;
@property (strong, nonatomic) FeaturedCollectionViewController *featuredCVC;
@property (strong, nonatomic) PlacesViewController *placesVC;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listItems = [[NSMutableArray alloc] init];
    [self loadHomePage];
    
    self.navigationBarButtonItem.target = self.revealViewController;
    self.navigationBarButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
//    Set size for spotlight and featured container view
    self.containerView = [self.view.subviews objectAtIndex:1];
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    [self.containerView setFrame:CGRectMake(0, 0, screenWidth, screenHeight * 0.615)];
    self.cellHeight = (screenHeight * 0.306);
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(loadHomePage)
                  forControlEvents:UIControlEventValueChanged];
}

- (void) loadHomePage {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-staging.herokuapp.com/api/v1/home_pages.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self removeErrorMessage];
        
        self.listItems = [[[responseObject objectForKey:@"home_page"] objectForKey:@"generic_lists"] mutableCopy];
        [self.listItems addObjectsFromArray:[[responseObject objectForKey:@"home_page"] objectForKey:@"contributor_lists"]];
        self.spotlightCVC.spotlightItems = [[[responseObject objectForKey:@"home_page"] objectForKey:@"spotlight"] objectForKey:@"spotlight_items"];
        self.featuredCVC.featuredItems = [[[responseObject objectForKey:@"home_page"] objectForKey:@"featured_list"] objectForKey:@"places"];

        [self.spotlightCVC.collectionView reloadData];
        [self.featuredCVC.collectionView reloadData];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self setErrorMessage];
        
    }];
    [self.refreshControl endRefreshing];
    [operation start];
}

#pragma mark - TableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listItems.count;
}


- (HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *listItem = [self.listItems objectAtIndex: indexPath.row];
    
    cell.listName.text = [listItem objectForKey:@"name"];
    cell.listType.text = [listItem objectForKey:@"type"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *list = [self.listItems objectAtIndex: indexPath.row];
    self.placesVC.placeItems = [list objectForKey:@"places"];
    self.placesVC.title = [list objectForKey:@"name"];
}

#pragma mark - Connection Error Rescue View

-(void)setErrorMessage {
    self.listItems = nil;
    self.spotlightCVC.spotlightItems = nil;
    self.featuredCVC.featuredItems = nil;
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (self.view.bounds.size.width - 10), self.view.bounds.size.height)];
    
    messageLabel.text = @"No data is currently available. Please pull down to refresh.";
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
    [messageLabel sizeToFit];
    
    self.tableView.backgroundView = messageLabel;
    self.tableView.backgroundView.hidden = NO;
    self.containerView.hidden = YES;
    
    [self.spotlightCVC.collectionView reloadData];
    [self.featuredCVC.collectionView reloadData];
    [self.tableView reloadData];
}

-(void)removeErrorMessage {
    self.tableView.backgroundView.hidden = YES;
    self.containerView.hidden = NO;
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedSpotlight"]) {
        self.spotlightCVC = (SpotlightCollectionViewController *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"embedFeatured"]) {
        self.featuredCVC = (FeaturedCollectionViewController *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"showListResults"]) {
        self.placesVC = (PlacesViewController *)segue.destinationViewController;
    }
}

@end
