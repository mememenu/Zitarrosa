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

const int KLoadingCellTag = 12345;
@interface FeedTableViewController ()

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.feedItems = [[NSMutableArray alloc] init];
//    self.currentPage = 0;
    self.totalPages = 10;
    
    
    
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(updateFeed)
                  forControlEvents:UIControlEventValueChanged];
//    [self loadFeed];
    [self.refreshControl beginRefreshing];
}

-(void) updateFeed {
    self.currentPage = 1;
    [self loadFeed];
}


- (void) loadFeed {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://mememenu-production.herokuapp.com/ios/paginated_dish_feed?page=%ld", (long)_currentPage]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (!self.refreshControl.refreshing) {
            for (id feedItem in responseObject) {
                if (![self.feedItems containsObject:feedItem]) {
                    [self.feedItems addObject:feedItem];
                }
            }
        } else {
            self.feedItems = [responseObject mutableCopy];
        }
        
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // insert failure block here
        [self.refreshControl endRefreshing];
    }];
    [operation start];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (_currentPage == 0) return 1;
    if (_currentPage < _totalPages) return self.feedItems.count + 1;
    return self.feedItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.825;
}

-(FeedTableViewCell *)dishCellForIndexPath:(NSIndexPath *)indexPath {
    FeedTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
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

#pragma mark - Infinite Scrolling Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row < self.feedItems.count) {
        return [self dishCellForIndexPath:indexPath];
    } else {
        return [self loadingCell];
    }
}

-(UITableViewCell *)loadingCell {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.tag = KLoadingCellTag;
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cell.tag == KLoadingCellTag) {
        _currentPage++;
        [self loadFeed];
    }
}


#pragma mark - Connection Error Rescue View

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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
