//
//  PlacePhotosViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 10/22/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V8HorizontalPickerView.h"
#import "V8HorizontalPickerViewProtocol.h"

@interface PlacePhotosViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, V8HorizontalPickerViewDataSource, V8HorizontalPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSDictionary *placeDictionary;
@property (nonatomic) NSArray *menusArray;
@property (nonatomic) NSArray *categoriesArray;
@property (nonatomic) NSMutableArray *dishesArray;

@property (nonatomic) V8HorizontalPickerView *menuPicker;

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index;
- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index;
- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index;

- (void)collectionViewSwipedLeft:(UISwipeGestureRecognizer*)recognizer;
- (void)collectionViewSwipedRight:(UISwipeGestureRecognizer*)recognizer;
- (void)initView;
@end
