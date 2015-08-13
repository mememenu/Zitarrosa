//
//  HomeTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/13/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "SWRevealViewController.h"

@interface HomeTableViewController ()

@end

@implementation HomeTableViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.barButtonItem.target = self.revealViewController;
    self.barButtonItem.action = @selector(revealToggle:);
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int rowsInSection;
    
    if (section == 0) {
        rowsInSection = 1;
    } else if (section == 1) {
        rowsInSection = 1;
    } else if (section == 2) {
        rowsInSection = 6;
    }
    
    return rowsInSection;
}


- (HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%li", indexPath.row + 1]];
    return cell;
}


// Optional method to title tableview sections
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *sectionTitle;
    
    if (section == 0) {
        sectionTitle = @"Spotlight";
    } else if (section == 1) {
        sectionTitle = @"Featured";
    } else if (section == 2) {
        sectionTitle = @"Lists";
    }
    return sectionTitle;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
