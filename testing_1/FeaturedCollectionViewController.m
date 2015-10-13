//
//  FeaturedCollectionViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/14/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "FeaturedCollectionViewController.h"
#import "FeaturedCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "PlaceShowViewController.h"

@interface FeaturedCollectionViewController ()

@property (strong, nonatomic) PlaceShowViewController *placeShowVC;

@end

@implementation FeaturedCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.scrollsToTop = NO;
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
    NSString *image_url = [[featuredItem objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
//    image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
    
//    set for real content to load from call
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url]];
    cell.featuredName.text = [featuredItem objectForKey:@"name"];
    cell.featuredType.text = @"Featured";
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    return CGSizeMake(collectionView.frame.size.width / 2, collectionView.frame.size.height);
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.placeShowVC.placeID = [[self.featuredItems objectAtIndex:indexPath.row] objectForKey:@"id"];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showFeaturedPlace"]) {
        self.placeShowVC = (PlaceShowViewController *)segue.destinationViewController;
    }
}

@end
