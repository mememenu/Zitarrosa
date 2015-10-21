//
//  PlaceMenuViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 10/21/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceMenuViewController.h"

@interface PlaceMenuViewController ()

@end

@implementation PlaceMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dishesArray = [[NSMutableArray alloc] init];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)initView{
    [self setHorizontalPicker];
    [self.tableView reloadData];
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
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewSwipedLeft:)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipeLeftRecognizer];
    
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tableViewSwipedRight:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipeRightRecognizer];
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
    [self.tableView reloadData];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
    return 120;
}

#pragma mark - Table view data source
// Entire tableView is one menu -- Each Section is a Category


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
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

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // Name of the Category
    return [[self.categoriesArray objectAtIndex:section] objectForKey:@"name"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of dishes per category
    return [[[self.categoriesArray objectAtIndex:section] objectForKey:@"dishes"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSArray *dishesArray = [[self.categoriesArray objectAtIndex:indexPath.section] objectForKey:@"dishes"];
    NSDictionary *dish = [dishesArray objectAtIndex:indexPath.row];
    
    // Set Name and Description of each dish
    cell.textLabel.text = [dish objectForKey:@"name"];
    cell.detailTextLabel.text = [dish objectForKey:@"description"];
    return cell;
}

#pragma mark - UISwipeGestureRecognizers

- (void)tableViewSwipedLeft:(UISwipeGestureRecognizer*)recognizer {
    if (self.menuPicker.currentSelectedIndex < self.menusArray.count - 1) {
        [self.menuPicker scrollToElement:self.menuPicker.currentSelectedIndex + 1 animated:YES];
        [self.tableView reloadData];
    }
}

- (void)tableViewSwipedRight:(UISwipeGestureRecognizer*)recognizer {
    if (self.menuPicker.currentSelectedIndex > 0) {
        [self.menuPicker scrollToElement:self.menuPicker.currentSelectedIndex - 1 animated:YES];
        [self.tableView reloadData];
    }
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
