//
//  WebViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = @"http://www.opentable.com/single.aspx?rid=160732&ref=9601";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
}


#pragma mark - IB Actions

- (IBAction)closeButtonPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
