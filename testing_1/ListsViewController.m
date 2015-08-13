//
//  ListsViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/13/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "ListsViewController.h"
#import "SWRevealViewController.h"

@interface ListsViewController ()

@end

@implementation ListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
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
