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

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.featuredItems.count;
}

- (FeaturedCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *featuredItem = [self.featuredItems objectAtIndex: indexPath.row];
    NSString *image_url = [featuredItem objectForKey:@"logo"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url]];
    cell.featuredName.text = [featuredItem objectForKey:@"name"];
    cell.featuredType.text = [featuredItem objectForKey:@"type"];
    
    return cell;
}


@end
