//
//  ListsViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/13/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "ListsViewController.h"
#import "ListsTableViewCell.h"
#import "SWRevealViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import "PlacesViewController.h"

@interface ListsViewController ()


@property (strong, nonatomic) PlacesViewController *placesVC;

@end

@implementation ListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLists];
    
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
//     Refresh Control
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor clearColor];
    self.refreshControl.tintColor = [UIColor grayColor];
    [self.refreshControl addTarget:self
                            action:@selector(loadLists)
                  forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

#pragma mark - Table View Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listItems count];
}

-(ListsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long) indexPath.row + 1]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.304;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *list = [self.listItems objectAtIndex:indexPath.row];
    self.placesVC.placeItems = [list objectForKey:@"places"];
    self.placesVC.title = [list objectForKey:@"name"];
}


- (void) loadLists {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/lists.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.listItems = [[responseObject objectForKey:@"lists"] mutableCopy];
        self.tableView.backgroundView.hidden = YES;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.listItems = nil;
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
