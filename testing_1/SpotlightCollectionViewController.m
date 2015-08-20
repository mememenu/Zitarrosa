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
//    [cell.spotlightImageView setImageWithURL:[NSURL URLWithString:image_url]];
//    cell.spotlightName.text = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"name"];
//    cell.spotlightType.text = [[spotlightItem objectForKey:@"spotable"] objectForKey:@"type"];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    
    //    iPhone 4 - 5 - 6 - 6 Plus
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight == 480){ return CGSizeMake(320, 144);
    }else if (screenHeight == 568){ return CGSizeMake(320, 170);
    }else if (screenHeight == 667){ return CGSizeMake(375, 200);
    }else{ return CGSizeMake(414, 220);
    }
    
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *spotable = [[self.spotlightItems objectAtIndex: indexPath.row] objectForKey:@"spotable"];

    NSLog(@"spotlight item type is: %@, name is: %@, spotable id is %@",
          [spotable objectForKey:@"type"],
          [spotable objectForKey:@"name"],
          [spotable objectForKey:@"id"]);
}

@end
