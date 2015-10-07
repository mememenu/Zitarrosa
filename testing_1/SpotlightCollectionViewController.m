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
#import "PlacesViewController.h"

@interface SpotlightCollectionViewController ()

@property (strong, nonatomic) PlacesViewController *placesVC;

@end

@implementation SpotlightCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.scrollsToTop = NO;
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
    NSDictionary *spotlightItem = [self.spotlightItems objectAtIndex:indexPath.row];
    
    NSString *image_url = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"cloudfront_url"];
//    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    
    cell.spotlightName.text = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"name"];
    [cell.spotlightImageView setImageWithURL:[NSURL URLWithString:image_url]];
    
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    return collectionView.frame.size;
    
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
