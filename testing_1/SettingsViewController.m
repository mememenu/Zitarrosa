//
//  SettingsViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/23/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#import "WebViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) WebViewController *webViewController;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationBarButtonItem.target = self.revealViewController;
    self.navigationBarButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}


- (IBAction)socialButtonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self performSegueWithIdentifier:@"showWebView" sender:button];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showWebView"]) {
        self.webViewController = (WebViewController *)segue.destinationViewController;
        UIButton *button = (UIButton *)sender;
        if (button.tag == 1) {
            self.webViewController.urlString = @"https://instagram.com/meme.menu/";
        } else if (button.tag == 2) {
            self.webViewController.urlString = @"https://twitter.com/_mememenu";
        } else if (button.tag == 3) {
            self.webViewController.urlString = @"https://www.facebook.com/mememenu";
        } else if (button.tag == 4) {
            self.webViewController.urlString = @"http://meme-menu.tumblr.com/";
        }
    }
}


@end
