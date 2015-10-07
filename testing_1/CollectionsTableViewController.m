//
//  CollectionsTableViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 8/31/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "CollectionsTableViewController.h"
#import "ListsTableViewCell.h"
#import "SWRevealViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import "PlacesViewController.h"

@interface CollectionsTableViewController ()

@property (strong, nonatomic) PlacesViewController *placesVC;

@end

@implementation CollectionsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCollections];
    
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //     Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(loadCollections)
                  forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Table View Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.collections count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.304;
}

-(ListsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *collection = [self.collections objectAtIndex:indexPath.row];
    
    cell.listNameLabel.text = [collection objectForKey:@"name"];
    cell.listType.text = [collection objectForKey:@"type"];
    
    NSString *image_url = [collection objectForKey:@"cloudfront_url"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url]];
    
    return cell;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *collection = [self.collections objectAtIndex:indexPath.row];
    self.placesVC.placeItems = [collection objectForKey:@"places"];
    self.placesVC.title = [collection objectForKey:@"name"];
}

- (void) loadCollections {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-production.herokuapp.com/api/v1/lists.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.tableView.backgroundView.hidden = YES;
        self.collections = [responseObject objectForKey:@"lists"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.collections = nil;
        [self setErrorMessage];
        [self.tableView reloadData];
    }];
    [self.refreshControl endRefreshing];
    [operation start];
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

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showListResults"]) {
        self.placesVC = (PlacesViewController *)segue.destinationViewController;
    }
}
@end
