//
//  PlacesTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/11/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "PlacesTableViewCell.h"

@interface PlacesTableViewController () <UISearchBarDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *allData;
@property (nonatomic, strong) NSArray *searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation PlacesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allData = @[@"One", @"Two", @"Three", @"Four", @"Five",
                     @"Six", @"Seven", @"Eight", @"Nine", @"Ten"];
}

-(void)viewWillAppear:(BOOL)animated {
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + self.searchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        return self.allData.count;
    } else {
        return self.searchResults.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    if (tableView == self.tableView) {
        cell.textLabel.text = [self.allData objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
    }
    
    
        
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    self.title = title;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Search Methods

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
        self.searchResults = nil;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [cd] %@", self.searchBar.text];
        
    self.searchResults = [self.allData filteredArrayUsingPredicate:predicate];
}
@end
