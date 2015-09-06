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
#import <CCMPopup/CCMPopupSegue.h>
#import "PopupViewController.h"

@interface PlacePhotosCollectionViewController ()

@property (strong, nonatomic) PopupViewController *popupViewController;

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

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    return [self cellSize:collectionView];
}


-(CGSize)cellSize:(UICollectionView *)collectionView {
    int screenWidth = collectionView.frame.size.width;
    int cellWidth = screenWidth * 0.468;
    int cellHeight = cellWidth + (cellWidth * 0.17);
    return CGSizeMake(cellWidth, cellHeight);
}

#pragma mark - Collection View Delegate 

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dishesArray = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"dishes"];
    NSDictionary *dish = [dishesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"showPopup" sender:dish];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue isKindOfClass:[CCMPopupSegue class]]){
        CCMPopupSegue *popupSegue = (CCMPopupSegue *)segue;
        popupSegue.destinationBounds = CGRectMake(0, 0, 300, 400);
        self.popupViewController = (PopupViewController *)popupSegue.destinationViewController;
        self.popupViewController.dish = sender;
    }
}

@end
