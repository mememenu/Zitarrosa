//
//  SpotlightCollectionViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/14/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "SpotlightCollectionViewController.h"
#import "SpotlightCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface SpotlightCollectionViewController ()

@end

@implementation SpotlightCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.spotlightItems.count;
}

- (SpotlightCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SpotlightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
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
