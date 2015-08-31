//
//  PlaceShowViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 8/31/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceShowViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface PlaceShowViewController ()

@end

@implementation PlaceShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [self loadPlace];
}


- (void) loadPlace {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://mememenu-development.herokuapp.com/api/v1/places/%@.json", self.placeID]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.placeDictionary = responseObject;
        [self populateView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    [operation start];
}


-(void)populateView {
    NSString *image_url = [[self.placeDictionary objectForKey:@"banner"] objectForKey:@"cloudfront_url"];
    [self.bannerImageView setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"white_sidebar"]];
    
    self.nameLabel.text = [_placeDictionary objectForKey:@"name"];
    self.cuisineLabel.text = @"Cuisine Label";
    self.openStatusLabel.text = @"Open Status Label";
    self.zoneLabel.text = [_placeDictionary objectForKey:@"zone"];
    self.distanceLabel.text = @"distance label";
    self.quoteOneLabel.text = @"First Quote";
    self.quoteTwoLabel.text = @"Second Quote";
    self.quoteThreeLabel.text = @"Third Quote";
    self.addressLabel.text = [_placeDictionary objectForKey:@"full_address"];
    self.phoneLabel.text = [_placeDictionary objectForKey:@"formatted_phone"];
}


- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
}


@end
