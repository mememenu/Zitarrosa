//
//  SpotlightCollectionViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/14/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "SpotlightCollectionViewController.h"
#import "SpotlightCollectionViewCell.h"
#import "SpotlightItem.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface SpotlightCollectionViewController ()

@end

@implementation SpotlightCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchSpotlightItems];
    
}

- (void) fetchSpotlightItems {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/home_pages.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *spotlightArray = [[[responseObject objectForKey:@"home_page"] objectForKey:@"spotlight"] objectForKey:@"spotlight_items"];
        self.spotlightItems = spotlightArray;
        [self.collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // insert failure block here
    }];
    [operation start];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.spotlightItems.count;
}

- (SpotlightCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SpotlightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *spotlightItem = [self.spotlightItems objectAtIndex: indexPath.row];
    NSString *image_url = [spotlightItem objectForKey:@"image_url"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    
    // Configure the cell
    [cell.spotlightImageView setImageWithURL:[NSURL URLWithString:image_url]];
    cell.spotlightName.text = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"name"];
    cell.spotlightType.text = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"type"];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"spotlight cell %li selected", indexPath.row);
}

@end
