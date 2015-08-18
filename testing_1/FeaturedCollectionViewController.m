//
//  FeaturedCollectionViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/14/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "FeaturedCollectionViewController.h"
#import "FeaturedCollectionViewCell.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface FeaturedCollectionViewController ()

@end

@implementation FeaturedCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchFeaturedItems];
    

}

- (void) fetchFeaturedItems {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/home_pages.json"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *featuredArray = [[[responseObject objectForKey:@"home_page"] objectForKey:@"featured_list"] objectForKey:@"places"];
        self.featuredItems = featuredArray;
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
    return self.featuredItems.count;
}

- (FeaturedCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    NSDictionary *featuredItem = [self.featuredItems objectAtIndex: indexPath.row];
    NSString *image_url = [featuredItem objectForKey:@"logo"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url]];
    cell.featuredName.text = [featuredItem objectForKey:@"name"];
    cell.featuredType.text = [featuredItem objectForKey:@"type"];
    
    return cell;
}


@end
