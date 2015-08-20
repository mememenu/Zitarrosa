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
    
//    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url]];
//    cell.featuredName.text = [featuredItem objectForKey:@"name"];
//    cell.featuredType.text = [featuredItem objectForKey:@"type"];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    //    iPhone 4 - 5 - 6 - 6 Plus
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (screenHeight == 480){ return CGSizeMake(159, 144);
    }else if (screenHeight == 568){ return CGSizeMake(159, 170);
    }else if (screenHeight == 667){ return CGSizeMake(186.5, 200);
    }else{ return CGSizeMake(206, 220);
    }
    
}

#pragma mark <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *featuredItem = [self.featuredItems objectAtIndex:indexPath.row];
    
    NSLog(@"featured item type is: %@, name is: %@, id is %@",
          [featuredItem objectForKey:@"type"],
          [featuredItem objectForKey:@"name"],
          [featuredItem objectForKey:@"id"]);
}

@end
