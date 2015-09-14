//
//  MBTwitterScroll.h
//  TwitterScroll
//
//  Created by Martin Blampied on 07/02/2015.
//  Copyright (c) 2015 MartinBlampied. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MBTable,
    MBScroll,
} MBType;


@protocol MBTwitterScrollDelegate <NSObject>
-(void)recievedMBTwitterScrollEvent;

@optional
-(void)recievedMBTwitterScrollButtonClicked;
@end


@interface MBTwitterScroll : UIView <UIScrollViewDelegate, MBTwitterScrollDelegate >


- (MBTwitterScroll *)initTableViewWithBackgound:(UIImage*)backgroundImage avatarImage:(UIImage *)avatarImage titleString:(NSString *)titleString;
- (MBTwitterScroll *)initScrollViewWithBackgound:(UIImage*)backgroundImage avatarImage:(UIImage *)avatarImage titleString:(NSString *)titleString contentHeight:(CGFloat)height;
-(void)updateHeaderImage:(UIImage*)newImage;

@property (strong, nonatomic) UIButton *backButton;
@property (strong, nonatomic) UIView *header;
@property (strong, nonatomic) UILabel *headerLabel;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImageView *avatarImage;
@property (strong, nonatomic) UIImageView *headerImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *openStatusLabel;
@property (strong, nonatomic) UILabel *zoneLabel;
@property (strong, nonatomic) UILabel *milesAwayLabel;

@property (strong, nonatomic) UILabel *quoteOneLabel;
@property (strong, nonatomic) UILabel *quoteTwoLabel;
@property (strong, nonatomic) UILabel *quoteThreeLabel;

@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIButton *phoneButton;
@property (strong, nonatomic) UIButton *reservationButton;

@property (nonatomic) UISegmentedControl *segmentedControl;

@property (nonatomic, strong) NSMutableArray *blurImages;
@property (nonatomic,strong) id<MBTwitterScrollDelegate>delegate;


@end
