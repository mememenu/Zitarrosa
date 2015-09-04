//
//  PlaceDetailsViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceDetailsViewController.h"

@interface PlaceDetailsViewController ()


@end

@implementation PlaceDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table View Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.detailsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    

    NSDictionary *dictionary = [[[self.detailsArray objectAtIndex:indexPath.row] objectForKey:@"items"] firstObject];
    cell.textLabel.text = [dictionary objectForKey:@"displayName"];
    cell.detailTextLabel.text = [dictionary objectForKey:@"displayValue"];
    
    return cell;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
