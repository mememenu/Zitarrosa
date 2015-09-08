//
//  PlaceViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/8/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceViewController.h"

@interface PlaceViewController ()

@end

static NSString * const reuseIdentifier = @"Cell";

@implementation PlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MBTwitterScroll *myTableView = [[MBTwitterScroll alloc]
                                    initTableViewWithBackgound:[UIImage imageNamed:@"sample_place_banner"]
                                    avatarImage:nil
                                    titleString:@"Place Name"];
    
    myTableView.tableView.delegate = self;
    myTableView.tableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
    
    [myTableView.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) recievedMBTwitterScrollEvent {
    NSLog(@"refresh place");
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    cell.textLabel.text =  @"Cell";
    
    return cell;
}


#pragma mark - Button Actions

-(void) backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
