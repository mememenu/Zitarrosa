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
#import "PlaceShowViewController.h"

const int KLoadingCellTag = 12345;
@interface FeedTableViewController ()

@property (nonatomic, strong) PlaceShowViewController *placeShowVieController;

@end

@implementation FeedTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.feedItems = [[NSMutableArray alloc] init];
    self.totalPages = 20;
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(updateFeed)
                  forControlEvents:UIControlEventValueChanged];
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
        self.tableView.backgroundView.hidden = YES;
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
        [self setErrorMessage];
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
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
    //    resize to medium to reduce image size and improve perfromance
    logoImageURL = [logoImageURL stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    NSString *dishImageURL = [feedItem objectForKey:@"cloud_front"];
    
    // Configure the cell
    [cell.logoImageView setImageWithURL:[NSURL URLWithString:logoImageURL]];
    [cell.dishImageView setImageWithURL:[NSURL URLWithString:dishImageURL] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    cell.placeName.text = [feedItem objectForKey:@"restaurant_name"];
    cell.zoneLabel.text = [feedItem objectForKey:@"restaurant_zone"];
    cell.dishName.text = [feedItem objectForKey:@"name"];
    cell.descriptionLabel.text = [feedItem objectForKey:@"description"];
    
    UITapGestureRecognizer *logoTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeItemPressed)];
    UITapGestureRecognizer *nameTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeItemPressed)];
    
    [cell.logoImageView addGestureRecognizer:logoTapGesture];
    [cell.placeName addGestureRecognizer:nameTapGesture];
    
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


#pragma mark - IBActions

-(void)placeItemPressed {
    [self performSegueWithIdentifier:@"showFeedPlace" sender:self];
}

#pragma mark - Connection Error Rescue View

-(void)setErrorMessage {
    self.feedItems = nil;
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (self.view.bounds.size.width - 10), self.view.bounds.size.height)];
    messageLabel.text = @"No data is currently available. Please pull down to refresh.";
    messageLabel.textColor = [UIColor blackColor];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.font = [UIFont fontWithName:@"Palatino-Italic" size:20];
    [messageLabel sizeToFit];
    
    self.tableView.backgroundView = messageLabel;
    self.tableView.backgroundView.hidden = NO;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showFeedPlace"]) {
        self.placeShowVieController = (PlaceShowViewController *)segue.destinationViewController;
        NSDictionary *dish = [self.feedItems objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        self.placeShowVieController.placeID = [[dish objectForKey:@"place"] objectForKey:@"id"];
    }
}

@end
