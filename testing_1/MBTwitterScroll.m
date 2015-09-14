//
//  MBTwitterScroll.m
//  TwitterScroll
//
//  Created by Martin Blampied on 07/02/2015.
//  Copyright (c) 2015 MartinBlampied. All rights reserved.
//

#import "MBTwitterScroll.h"
#import "UIScrollView+TwitterCover.h"

CGFloat const offset_HeaderStop = 40.0;
CGFloat const offset_B_LabelHeader = 95.0;
CGFloat const distance_W_LabelHeader = 35.0;


@implementation MBTwitterScroll

- (MBTwitterScroll *)initScrollViewWithBackgound:(UIImage*)backgroundImage avatarImage:(UIImage *)avatarImage titleString:(NSString *)titleString contentHeight:(CGFloat)height {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self = [[MBTwitterScroll alloc] initWithFrame:bounds];
    [self setupView:backgroundImage avatarImage:avatarImage titleString:titleString scrollHeight:height type:MBScroll];
    
    return self;
}


- (MBTwitterScroll *)initTableViewWithBackgound:(UIImage*)backgroundImage avatarImage:(UIImage *)avatarImage titleString:(NSString *)titleString {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self = [[MBTwitterScroll alloc] initWithFrame:bounds];
    
    [self setupView:backgroundImage avatarImage:avatarImage titleString:titleString scrollHeight:0 type:MBTable];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    return self;
    
}



- (void) setupView:(UIImage*)backgroundImage avatarImage:(UIImage *)avatarImage titleString:(NSString *)titleString scrollHeight:(CGFloat)height type:(MBType)type {
    
    
    // Header
    self.header = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 160)];
    [self addSubview:self.header];
    self.headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.header.frame.size.height - 20, self.frame.size.width, 25)];
    self.headerLabel.textAlignment = NSTextAlignmentCenter;
    self.headerLabel.text = titleString;
    self.headerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    self.headerLabel.textColor = [UIColor whiteColor];
    [self.header addSubview:self.headerLabel];
        
    if (type == MBTable) {
        // TableView
        self.tableView = [[UITableView alloc] initWithFrame:self.frame];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.showsVerticalScrollIndicator = NO;
        
        // TableView Header
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.header.frame.size.height + 220)];
        [self addSubview:self.tableView];
        
    } else {
        
        // Scroll
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        CGSize newSize = CGSizeMake(self.frame.size.width, height);
        self.scrollView.contentSize = newSize;
        self.scrollView.delegate = self;
    }
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 25, 30, 30)];
    [self.backButton setImage:[UIImage imageNamed:@"white-arrow"] forState:UIControlStateNormal];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (self.header.frame.size.height / 2), self.tableView.frame.size.width, 22)];
    self.titleLabel.text = titleString;
    self.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    
    self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, (self.header.frame.size.height - 36), 100, 16)];
    self.descriptionLabel.text = @"Description";
    self.descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.descriptionLabel.textColor = [UIColor whiteColor];
    
    self.openStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, (self.header.frame.size.height - 20), 100, 16)];
    self.openStatusLabel.text = @"Open Status";
    self.openStatusLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.openStatusLabel.textColor = [UIColor whiteColor];
    
    self.zoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 108, (self.header.frame.size.height - 36), 100, 16)];
    self.zoneLabel.text = @"Zone Label";
    self.zoneLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.zoneLabel.textColor = [UIColor whiteColor];
    self.zoneLabel.textAlignment = NSTextAlignmentRight;
    
    self.milesAwayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 108, (self.header.frame.size.height - 20), 100, 16)];
    self.milesAwayLabel.text = @"1.0 Miles Away";
    self.milesAwayLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12];
    self.milesAwayLabel.textColor = [UIColor whiteColor];
    self.milesAwayLabel.textAlignment = NSTextAlignmentRight;
    
    self.quoteOneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.header.frame.size.height + 8), (self.header.frame.size.width - 20), 16)];
    self.quoteOneLabel.text = @"quote one placeholder text";
    self.quoteOneLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    self.quoteOneLabel.textColor = [UIColor blackColor];
    self.quoteOneLabel.textAlignment = NSTextAlignmentCenter;
    
    self.quoteTwoLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.header.frame.size.height + 32), (self.header.frame.size.width - 20), 16)];
    self.quoteTwoLabel.text = @"quote two placeholder text";
    self.quoteTwoLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    self.quoteTwoLabel.textColor = [UIColor blackColor];
    self.quoteTwoLabel.textAlignment = NSTextAlignmentCenter;
    
    self.quoteThreeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.header.frame.size.height + 56), (self.header.frame.size.width - 20), 16)];
    self.quoteThreeLabel.text = @"quote three placeholder text";
    self.quoteThreeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    self.quoteThreeLabel.textColor = [UIColor blackColor];
    self.quoteThreeLabel.textAlignment = NSTextAlignmentCenter;
    
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, (self.header.frame.size.height + 90), (self.frame.size.width / 2.2), 35)];
    self.addressLabel.text = @"244 Biscyane Blvd. Apt #4803 Miami, FL 33132";
    self.addressLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
    self.addressLabel.textColor = [UIColor grayColor];
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.addressLabel.adjustsFontSizeToFitWidth = YES;
    self.addressLabel.minimumScaleFactor = 0.65;

    self.phoneButton = [[UIButton alloc] initWithFrame:CGRectMake((self.frame.size.width - 110), (self.header.frame.size.height + 90), 100, 35)];
    [self.phoneButton setTitle:@"(123) 456-7657" forState:UIControlStateNormal];
    [self.phoneButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.phoneButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
    
    self.reservationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, (self.header.frame.size.height + 140), self.frame.size.width, 40)];
    [self.reservationButton setTitle:@"Make a reservation now" forState:UIControlStateNormal];
    self.reservationButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    [self.reservationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reservationButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

    NSArray *itemArray = [NSArray arrayWithObjects: @"Menu", @"Photos", @"Maps", @"Details", nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    self.segmentedControl.frame = CGRectMake(0, (self.header.frame.size.height + 180), self.frame.size.width, 43);
    [self.segmentedControl setTintColor:[UIColor blackColor]];
    
    
    
    if (type == MBTable) {
        [self.tableView addSubview:self.backButton];
        [self.tableView addSubview:self.titleLabel];
        [self.tableView addSubview:self.descriptionLabel];
        [self.tableView addSubview:self.openStatusLabel];
        [self.tableView addSubview:self.zoneLabel];
        [self.tableView addSubview:self.milesAwayLabel];
        [self.tableView addSubview:self.quoteOneLabel];
        [self.tableView addSubview:self.quoteTwoLabel];
        [self.tableView addSubview:self.quoteThreeLabel];
        [self.tableView addSubview:self.addressLabel];
        [self.tableView addSubview:self.phoneButton];
        [self.tableView addSubview:self.reservationButton];
        [self.tableView addSubview:self.segmentedControl];
    } else {
        [self.tableView addSubview:self.backButton];
        [self.scrollView addSubview:self.titleLabel];
        [self.scrollView addSubview:self.descriptionLabel];
        [self.scrollView addSubview:self.openStatusLabel];
        [self.scrollView addSubview:self.zoneLabel];
        [self.scrollView addSubview:self.milesAwayLabel];
        [self.scrollView addSubview:self.quoteOneLabel];
        [self.scrollView addSubview:self.quoteTwoLabel];
        [self.scrollView addSubview:self.quoteThreeLabel];
        [self.scrollView addSubview:self.addressLabel];
        [self.scrollView addSubview:self.phoneButton];
        [self.scrollView addSubview:self.reservationButton];
        [self.scrollView addSubview:self.segmentedControl];
    }
    
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:self.header.frame];
    self.headerImageView.image = backgroundImage;
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.header insertSubview:self.headerImageView aboveSubview:self.headerLabel];
    self.header.clipsToBounds = YES;
    
    self.avatarImage.layer.cornerRadius = 10;
    self.avatarImage.layer.borderWidth = 3;
    self.avatarImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.blurImages = [[NSMutableArray alloc] init];
    
    if (backgroundImage != nil) {
        [self prepareForBlurImages];
    } else {
        self.headerImageView.backgroundColor = [UIColor blackColor];
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    [self animationForScroll:offset];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    CGFloat offset = self.tableView.contentOffset.y;
    [self animationForScroll:offset];
}


- (void) animationForScroll:(CGFloat) offset {
    
    CATransform3D headerTransform = CATransform3DIdentity;
    CATransform3D avatarTransform = CATransform3DIdentity;
    
    // DOWN -----------------
    
    if (offset < 0) {
        
        CGFloat headerScaleFactor = -(offset) / self.header.bounds.size.height;
        CGFloat headerSizevariation = ((self.header.bounds.size.height * (1.0 + headerScaleFactor)) - self.header.bounds.size.height)/2.0;
        headerTransform = CATransform3DTranslate(headerTransform, 0, headerSizevariation, 0);
        headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0);
        
        self.header.layer.transform = headerTransform;
        
        if (offset < -self.frame.size.height/3.5) {
            [self recievedMBTwitterScrollEvent];
        }
        
    }
    
    // SCROLL UP/DOWN ------------
    
    else {
        
        // Header -----------
        headerTransform = CATransform3DTranslate(headerTransform, 0, MAX(-offset_HeaderStop, -offset), 0);
        
        //  ------------ Label
        CATransform3D labelTransform = CATransform3DMakeTranslation(0, MAX(-distance_W_LabelHeader, offset_B_LabelHeader - offset), 0);
        self.headerLabel.layer.transform = labelTransform;
        self.headerLabel.layer.zPosition = 2;
        
        // Avatar -----------
        CGFloat avatarScaleFactor = (MIN(offset_HeaderStop, offset)) / self.avatarImage.bounds.size.height / 1.4; // Slow down the animation
        CGFloat avatarSizeVariation = ((self.avatarImage.bounds.size.height * (1.0 + avatarScaleFactor)) - self.avatarImage.bounds.size.height) / 2.0;
        avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSizeVariation, 0);
        avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0);
        
        if (offset <= offset_HeaderStop) {
            
            if (self.avatarImage.layer.zPosition <= self.headerImageView.layer.zPosition) {
                self.header.layer.zPosition = 0;
            }
            
        }else {
            if (self.avatarImage.layer.zPosition >= self.headerImageView.layer.zPosition) {
                self.header.layer.zPosition = 2;
            }
        }
        
    }
    if (self.headerImageView.image != nil) {
        [self blurWithOffset:offset];
    }
    self.header.layer.transform = headerTransform;
    self.avatarImage.layer.transform = avatarTransform;
    
    
}


- (void)prepareForBlurImages {
    CGFloat factor = 0.1;
    [self.blurImages addObject:self.headerImageView.image];
    for (NSUInteger i = 0; i < self.headerImageView.frame.size.height/10; i++) {
        [self.blurImages addObject:[self.headerImageView.image boxblurImageWithBlur:factor]];
        factor+=0.04;
    }
}



- (void) blurWithOffset:(float)offset {
    NSInteger index = offset / 10;
    if (index < 0) {
        index = 0;
    }
    else if(index >= self.blurImages.count) {
        index = self.blurImages.count - 1;
    }
    UIImage *image = self.blurImages[index];
    if (self.headerImageView.image != image) {
        [self.headerImageView setImage:image];
    }
}


- (void) recievedMBTwitterScrollEvent {
    [self.delegate recievedMBTwitterScrollEvent];
}


// Function to blur the header image (used if the header image is replaced with updateHeaderImage)
-(void)resetBlurImages {
    [self.blurImages removeAllObjects];
    [self prepareForBlurImages];
}


// Function to update the header image and blur it out appropriately
-(void)updateHeaderImage:(UIImage*)newImage {
    self.headerImageView.image = newImage;
    [self resetBlurImages];
}

@end
