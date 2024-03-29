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
#import "PlaceShowViewController.h"

@interface PlacesViewController ()

@property (strong, nonatomic) PlaceShowViewController *placeShowVC;

@end

@implementation PlacesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    NSString *image_url = [place objectForKey:@"logo"];
    
    //    check place has a banner object present
    if ([place objectForKey:@"banner"] != (id)[NSNull null]) {
        // check if banner has a Cloud Front URL
        if ([[place objectForKey:@"banner"] objectForKey:@"cloudfront_url"] != (id)[NSNull null]) {
            image_url = [[place objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
            //            image_url = [image_url stringByReplacingOccurrencesOfString:@"large" withString:@"medium"];
        } else {
            image_url = [[place objectForKey:@"banner"] objectForKey:@"image_url"];
            //            image_url = [image_url stringByReplacingOccurrencesOfString:@"original" withString:@"medium"];
        }
    }
    //    !!!!!!!!replace with proper placeholder!!!!!!
    [cell.backgroundImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    
    cell.placeNameLabel.text = [place objectForKey:@"name"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.24;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.placeShowVC.placeID = [[self.placeItems objectAtIndex:indexPath.row] objectForKey:@"id"];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPlace"]) {
        self.placeShowVC = (PlaceShowViewController *)segue.destinationViewController;
    }
}


@end
