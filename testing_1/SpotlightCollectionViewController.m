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
#import "PlaceShowViewController.h"

@interface SpotlightCollectionViewController ()

@property (strong, nonatomic) PlacesViewController *placesVC;
@property (strong, nonatomic) PlaceShowViewController *placeShowVC;

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
    NSDictionary *spotable = [spotlightItem objectForKey:@"spotable"];
    NSString *image_url = @"";
        
    if ([[spotable objectForKey:@"type"] isEqualToString:@"List"]) {
       image_url = [spotable objectForKey:@"cloudfront_url"];
        
    } else if ([[spotable objectForKey:@"type"] isEqualToString:@"Place"]) {
        image_url = [[spotable objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
    }
    
    cell.spotlightName.text = [spotable objectForKey:@"name"];
    [cell.spotlightImageView setImageWithURL:[NSURL URLWithString:image_url]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    return collectionView.frame.size;
    
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *spotlightItem = [self.spotlightItems objectAtIndex:indexPath.row];
    NSDictionary *spotable = [spotlightItem objectForKey:@"spotable"];
    
    if ([[spotable objectForKey:@"type"] isEqualToString:@"List"]) {
        [self performSegueWithIdentifier:@"showList" sender:spotable];
    }
    
    if ([[spotable objectForKey:@"type"] isEqualToString:@"Place"]) {
        [self performSegueWithIdentifier:@"showPlace" sender:spotable];
    }
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSDictionary *spotable = sender;
    
    if ([segue.identifier isEqualToString:@"showPlace"]) {
        self.placeShowVC = (PlaceShowViewController *)segue.destinationViewController;
        self.placeShowVC.placeID = [spotable objectForKey:@"id"];
        
    }
    if ([segue.identifier isEqualToString:@"showList"]) {
        self.placesVC = (PlacesViewController *)segue.destinationViewController;
        self.placesVC.placeItems = [[spotable objectForKey:@"places"] mutableCopy];
        self.placesVC.title = [spotable objectForKey:@"name"];
    }
}


@end
