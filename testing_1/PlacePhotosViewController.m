//
//  PlacePhotosViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 10/22/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlacePhotosViewController.h"
#import "PlacePhotosCollectionViewCell.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import <CCMPopup/CCMPopupSegue.h>
#import "PopupViewController.h"
#import "PhotosCollectionReusableView.h"

@interface PlacePhotosViewController ()
@property (strong, nonatomic) PopupViewController *popupViewController;
@end

@implementation PlacePhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dishesArray = [[NSMutableArray alloc] init];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

-(void)initView{
    [self setHorizontalPicker];
    [self.collectionView reloadData];
}

-(void)setHorizontalPicker {
    UIFont *font = [UIFont systemFontOfSize:18.0];
    V8HorizontalPickerView *menuPicker = [[V8HorizontalPickerView alloc]init];
    menuPicker.dataSource = self;
    menuPicker.delegate = self;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat pickerHeight = 30;
    
    //    left - top - width - height
    [menuPicker setFrame:CGRectMake(0, 0, screenWidth, pickerHeight)];
    
    menuPicker.backgroundColor = [UIColor whiteColor];
    menuPicker.textColor = [UIColor blackColor];
    menuPicker.selectedTextColor = [UIColor colorWithRed:0.0 green:0.6 blue:1.0 alpha:1.0];
    menuPicker.elementFont = font;
    self.menuPicker = menuPicker;
    [self.view addSubview:self.menuPicker];
    [self.menuPicker scrollToElement:0 animated:NO];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(collectionViewSwipedLeft:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.collectionView addGestureRecognizer:swipeLeftRecognizer];
    
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(collectionViewSwipedRight:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.collectionView addGestureRecognizer:swipeRightRecognizer];
}


#pragma mark - <V8HorizontalPicker Datasource>

- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker {
    if (self.menusArray == (id)[NSNull null]) {
        [self.menuPicker reloadData];
        return self.menusArray.count;
    } else {
        return self.menusArray.count;
    }
    
}

- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index {
    NSDictionary *menu = [self.menusArray objectAtIndex:index];
    NSString *name = [[menu objectForKey:@"name"]uppercaseString];
    return name;
}

#pragma mark - <V8HorizontalPicker Delegate>

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index {
    [self.menusArray objectAtIndex:index];
    [self.collectionView reloadData];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
    return 120;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // Number of Categories in the menu
    [self.dishesArray removeAllObjects];
    self.categoriesArray = [[self.menusArray objectAtIndex:self.menuPicker.currentSelectedIndex] objectForKey:@"categories"];
    
    for (int i = 0; i < [self.categoriesArray count]; i++) {
        
        for (int x = 0; x < [[[self.categoriesArray objectAtIndex:i] objectForKey:@"dishes"] count]; x++) {
            NSDictionary *dish = [[[self.categoriesArray objectAtIndex:i] objectForKey:@"dishes"] objectAtIndex:x];
            [self.dishesArray addObject:dish];
        }
        
    }
    return [self.categoriesArray count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // Number of dishes per category
    return [[[self.categoriesArray objectAtIndex:section] objectForKey:@"dishes"] count];
}

- (PlacePhotosCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PlacePhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSArray *dishesArray = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"dishes"];
    NSDictionary *dish = [dishesArray objectAtIndex:indexPath.row];
    NSString *image_url = [[dish objectForKey:@"default_image"] objectForKey:@"cloudfront_url"];
    image_url = [image_url stringByReplacingOccurrencesOfString:@"large" withString:@"medium"];
    
    cell.nameLabel.text = [dish objectForKey:@"name"];
    [cell.imageView setImageWithURL:[NSURL URLWithString:image_url]];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath; {
    return [self cellSize:collectionView];
}

-(CGSize)cellSize:(UICollectionView *)collectionView {
    int screenWidth = collectionView.frame.size.width;
    int cellWidth = screenWidth * 0.499;
    int cellHeight = cellWidth + 17;
    return CGSizeMake(cellWidth, cellHeight);
}

-(PhotosCollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    PhotosCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    headerView.titleLabel.text = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"name"];
    
    return headerView;
    
    
}

#pragma mark - Collection View Delegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dishesArray = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"dishes"];
    NSDictionary *dish = [dishesArray objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"showPopup" sender:dish];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    if ([segue isKindOfClass:[CCMPopupSegue class]]){
        CCMPopupSegue *popupSegue = (CCMPopupSegue *)segue;
        popupSegue.destinationBounds = CGRectMake(0, 0, (screenWidth * .90), (screenHeight * .66));
        self.popupViewController = (PopupViewController *)popupSegue.destinationViewController;
        self.popupViewController.dish = sender;
    }
}

#pragma mark - UISwipeGestureRecognizers

- (void)collectionViewSwipedLeft:(UISwipeGestureRecognizer*)recognizer {
    if (self.menuPicker.currentSelectedIndex < self.menusArray.count - 1) {
        [self.menuPicker scrollToElement:self.menuPicker.currentSelectedIndex + 1 animated:YES];
        [self.collectionView reloadData];
    }
}

- (void)collectionViewSwipedRight:(UISwipeGestureRecognizer*)recognizer {
    if (self.menuPicker.currentSelectedIndex > 0) {
        [self.menuPicker scrollToElement:self.menuPicker.currentSelectedIndex - 1 animated:YES];
        [self.collectionView reloadData];
    }
}

@end
