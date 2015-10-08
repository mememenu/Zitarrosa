//
//  PlaceMapViewController.h
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface PlaceMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic) CLLocation *placeLocation;
@property (nonatomic) NSDictionary *placeDictionary;

@property (weak, nonatomic) IBOutlet UIButton *directionsButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)directionsPressed:(id)sender;

@end
