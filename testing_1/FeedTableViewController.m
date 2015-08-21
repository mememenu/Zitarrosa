//
//  FeedTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/21/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "FeedTableViewController.h"
#import "SWRevealViewController.h"
#import "FeedTableViewCell.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadFeed];
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feedItems.count;
}


- (FeedTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *feedItem = [self.feedItems objectAtIndex:indexPath.row];
    NSString *logoImageURL = [feedItem objectForKey:@"restaurant_avatar"];
    logoImageURL = [logoImageURL stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    NSString *dishImageURL = [feedItem objectForKey:@"cloud_front"];
    
    // Configure the cell
    [cell.logoImageView setImageWithURL:[NSURL URLWithString:logoImageURL]];
    [cell.dishImageView setImageWithURL:[NSURL URLWithString:dishImageURL] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    cell.placeName.text = [feedItem objectForKey:@"restaurant_name"];
    cell.zoneLabel.text = [feedItem objectForKey:@"restaurant_zone"];
    cell.dishName.text = [feedItem objectForKey:@"name"];
    cell.descriptionLabel.text = [feedItem objectForKey:@"description"];
    
    return cell;
}


- (void) loadFeed {
    NSURL *url = [NSURL URLWithString:@"https://mememenu-production.herokuapp.com/ios/paginated_dish_feed?page=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.feedItems = responseObject;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // insert failure block here
    }];
    
    [operation start];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
