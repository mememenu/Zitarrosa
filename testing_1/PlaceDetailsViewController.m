//
//  PlaceDetailsViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceDetailsViewController.h"
#import "WebViewController.h"

@interface PlaceDetailsViewController ()

@property (strong, nonatomic) WebViewController *webViewController;

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


- (IBAction)socialMediaButtonPressed:(id)sender {
    UIButton *button = (UIButton *)sender;
    [self performSegueWithIdentifier:@"showSocialMedia" sender:button];
    

}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    self.webViewController = (WebViewController *)segue.destinationViewController;
    UIButton *button = (UIButton *)sender;
    if (button.tag == 1) {
        self.webViewController.urlString = [self.placeDictionary objectForKey:@"facebook"];
    } else if (button.tag == 2) {
        self.webViewController.urlString = [self.placeDictionary objectForKey:@"twitter"];
    } else {
        self.webViewController.urlString = [self.placeDictionary objectForKey:@"instagram"];
    }
}

@end
