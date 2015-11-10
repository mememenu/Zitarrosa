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

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationBarButtonItem.target = self.revealViewController;
    self.navigationBarButtonItem.action = @selector(revealToggle:);
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultSent: {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Email Sent" message:@"Your email has been succesfully sent." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            break;
        }
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultFailed:
            break;
        default: {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"An error occurred when trying to send this email. Please check your internet connection and try again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            break;
        }
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - IB Actions

- (IBAction)socialButtonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self performSegueWithIdentifier:@"showWebView" sender:button];
}

- (IBAction)contactButtonPressed:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Meme Menu (iPhone)"];
        [mail setToRecipients:@[@"hello@meme.menu"]];
        [self presentViewController:mail animated:YES completion:NULL];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Mail is not yet configured on your device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
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
