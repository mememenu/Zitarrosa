//
//  SettingsViewController.h
//  testing_1
//
//  Created by Alfonso Pintos on 8/23/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SettingsViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *navigationBarButtonItem;

@end
