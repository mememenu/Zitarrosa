//
//  PlacesViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 8/28/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlacesViewController.h"
#import "PlacesTableViewCell.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface PlacesViewController ()

@end

@implementation PlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.placesCountLabel.text = [NSString stringWithFormat:@"%lu Places", (unsigned long)[self.placeItems count]];
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self.placeItems count];
}

-(PlacesTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *place = [self.placeItems objectAtIndex:indexPath.row];
//    NSString *imageURL = [[place objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
//    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    cell.placeNameLabel.text = [place objectForKey:@"name"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.24;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"selected %@", [self.placeItems objectAtIndex:indexPath.row]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
