//
//  PlacePhotosCollectionViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/1/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlacePhotosCollectionViewController.h"
#import "PlacePhotosCollectionViewCell.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface PlacePhotosCollectionViewController ()

@end

@implementation PlacePhotosCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // Number of Categories in the menu
    self.menuDictionary = [self.menusArray firstObject];
    self.categoriesArray = [self.menuDictionary objectForKey:@"categories"];
    return [self.categoriesArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // Number of dishes per category
    return [[[self.categoriesArray objectAtIndex:section] objectForKey:@"dishes"] count];
}

- (PlacePhotosCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PlacePhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSArray *dishesArray = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"dishes"];
    NSDictionary *dish = [dishesArray objectAtIndex:indexPath.row];
    NSString *image_url = [[dish objectForKey:@"default_image"] objectForKey:@"cloudfront_url"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"large" withString:@"medium"];
    
    cell.nameLabel.text = [dish objectForKey:@"name"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"featured_1"]];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
