//
//  PlaceMapViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceMapViewController.h"
#import <MapKit/MapKit.h>

@interface PlaceMapViewController ()

@end

@implementation PlaceMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = self.placeLocation.coordinate;
    [self.mapView setRegion:[self.mapView regionThatFits:mapRegion] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = self.placeLocation.coordinate;
    point.title = @"Place Location";
    point.subtitle = @"Place cuisine, open label, or any other info";
    [self.mapView addAnnotation:point];
}

#pragma mark - IBActions 

- (IBAction)directionsPressed:(id)sender {
    CGFloat endLat = self.placeLocation.coordinate.latitude;
    CGFloat endLong = self.placeLocation.coordinate.longitude;
    
    // Check for iOS 6
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)]) {
        // Create an MKMapItem to pass to the Maps app
        CLLocationCoordinate2D coordinate =
        CLLocationCoordinate2DMake(endLat, endLong);
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                       addressDictionary:nil];
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
        [mapItem setName:[self.placeDictionary objectForKey:@"name"]];
        
        // Set the directions mode to "Walking"
        // Can use MKLaunchOptionsDirectionsModeDriving instead
        NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
        // Get the "Current User Location" MKMapItem
        MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
        // Pass the current location and destination map items to the Maps app
        // Set the direction mode in the launchOptions dictionary
        [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                       launchOptions:launchOptions];
    }
    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
