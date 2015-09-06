//
//  PopupViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 9/6/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupViewController : UIViewController

@property (nonatomic) NSDictionary *dish;
@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

- (IBAction)backButtonPressed:(id)sender;

@end
