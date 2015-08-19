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
 
@interface HomeTableViewController ()

@property (strong, nonatomic) SpotlightCollectionViewController *spotlightCVC;
@property (strong, nonatomic) FeaturedCollectionViewController *featuredCVC;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadHomePage];
    
    self.navigationBarButtonItem.target = self.revealViewController;
    self.navigationBarButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
}

- (void) loadHomePage {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/home_pages.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.listItems = [[NSMutableArray alloc] init];
        
//        set class variable listItems equal to combination of generic_lists & contributor arrays
        NSArray *genericLists = [[responseObject objectForKey:@"home_page"] objectForKey:@"generic_lists"];
        NSArray *contributorLists = [[responseObject objectForKey:@"home_page"] objectForKey:@"contributor_lists"];
 
        [self.listItems addObjectsFromArray:genericLists];
        [self.listItems addObjectsFromArray:contributorLists];
        
//        set spotlight and featured itemArrays equal to response 
        self.spotlightCVC.spotlightItems = [[[responseObject objectForKey:@"home_page"] objectForKey:@"spotlight"] objectForKey:@"spotlight_items"];
        self.featuredCVC.featuredItems = [[[responseObject objectForKey:@"home_page"] objectForKey:@"featured_list"] objectForKey:@"places"];
        
//        reload data on all views in homepage
        [self.spotlightCVC.collectionView reloadData];
        [self.featuredCVC.collectionView reloadData];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // insert failure block here
    }];
    
    [operation start];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listItems.count;
}


- (HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *listItem = [self.listItems objectAtIndex: indexPath.row];
    
//    cell.backgroundImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li", 6 -indexPath.row]];
    cell.listName.text = [listItem objectForKey:@"name"];
    cell.listType.text = [listItem objectForKey:@"type"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"embedSpotlight"]) {
        self.spotlightCVC = (SpotlightCollectionViewController *)segue.destinationViewController;
    } else if ([segue.identifier isEqualToString:@"embedFeatured"]) {
        self.featuredCVC = (FeaturedCollectionViewController *)segue.destinationViewController;
    }
}

@end
