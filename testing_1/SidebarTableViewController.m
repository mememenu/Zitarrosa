//
//  SidebarTableViewController.m
//  testing_1
//
//  Created by Alfonso Pintos on 8/11/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "SidebarTableViewController.h"


@interface SidebarTableViewController ()

@end

@implementation SidebarTableViewController{
    NSArray *menu;
}

-(void)viewDidAppear:(BOOL)animated {
    if ([self.tableView indexPathForSelectedRow] == NULL) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:NO scrollPosition:0];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackgroundImage];
    [self setFooterHeight];
    
    self.revealViewController.delegate = self;
    [self setClearsSelectionOnViewWillAppear:NO];
    menu = @[@"Search", @"Browse", @"Around You", @"Feed", @"Your List"];
    
}

-(void)setBackgroundImage {
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sidebar-background.png"]];
    [tempImageView setFrame:self.tableView.frame];
    tempImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView.backgroundView = tempImageView;
}

-(void)setFooterHeight{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.tableFooterView = self.footerView;
    [self.tableView.tableFooterView setFrame: CGRectMake(0, 180, screenWidth, screenHeight * 0.24)];
    [self.tableView.tableHeaderView setFrame: CGRectMake(0, 0, screenWidth, screenHeight * 0.27)];
}

#pragma mark - Status Bar Style

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark - Reveal View Controller Delegate

-(void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position {
    if (revealController.frontViewPosition == 4) {
        UIView *lockingView = [[UIView alloc] initWithFrame:revealController.frontViewController.view.frame];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:revealController action:@selector(revealToggle:)];
        [lockingView addGestureRecognizer:tap];
        [lockingView setTag:1000];
        [revealController.frontViewController.view addSubview:lockingView];
    }
    else
        [[revealController.frontViewController.view viewWithTag:1000] removeFromSuperview];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
//    Set selected cell attributes
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = selectedView;
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight * 0.07;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
        
}


@end
