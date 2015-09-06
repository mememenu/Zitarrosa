//
//  PopupViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/6/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PopupViewController.h"
#import <AFNetworking.h>
#import "UIImageView+AFNetworking.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameLabel.text = [self.dish objectForKey:@"name"];
    self.descriptionLabel.text = [self.dish objectForKey:@"description"];
    [self.imageView setImageWithURL:[NSURL URLWithString:[[_dish objectForKey:@"default_image"] objectForKey:@"cloudfront_url"]]];
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
