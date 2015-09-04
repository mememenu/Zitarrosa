//
//  PlaceMapViewController.m
//  version_2
//
//  Created by Alfonso Pintos on 9/2/15.
//  Copyright © 2015 Meme Menu. All rights reserved.
//

#import "PlaceMapViewController.h"

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
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
