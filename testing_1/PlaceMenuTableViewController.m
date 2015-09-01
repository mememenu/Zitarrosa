//
//  PlaceMenuTableViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/1/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceMenuTableViewController.h"

@interface PlaceMenuTableViewController ()

@end

@implementation PlaceMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
// Using Only First Menu for now
// Whole tableView is one Menu
// Each Section is a Category
// Number of rows in section is number of dishes in category

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Number of Categories in the menu
    self.menuDictionary = [self.menusArray firstObject];
    self.categoriesArray = [self.menuDictionary objectForKey:@"categories"];
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





#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
