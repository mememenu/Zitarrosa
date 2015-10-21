//
//  PlaceMenuViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 10/21/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "V8HorizontalPickerView.h"
#import "V8HorizontalPickerViewProtocol.h"

@interface PlaceMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, V8HorizontalPickerViewDataSource, V8HorizontalPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSDictionary *placeDictionary;
@property (nonatomic) NSArray *menusArray;
@property (nonatomic) NSArray *categoriesArray;
@property (nonatomic) NSMutableArray *dishesArray;

@property (nonatomic) V8HorizontalPickerView *menuPicker;

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index;
- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index;
- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index;

- (void)tableViewSwipedLeft:(UISwipeGestureRecognizer*)recognizer;
- (void)tableViewSwipedRight:(UISwipeGestureRecognizer*)recognizer;
-(void)initView;
@end
