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
    
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = self.placeLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.2;
    mapRegion.span.longitudeDelta = 0.2;
    [self.mapView setRegion:mapRegion animated:YES];
}

#pragma mark - IBActions 

- (IBAction)directionsPressed:(id)sender {
    NSLog(@"Open with Maps");
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
