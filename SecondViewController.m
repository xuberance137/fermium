//
//  SecondViewController.m
//  GeoTrackerPro
//
//  Created by Gopal Erinjippurath on 3/7/14.
//  Copyright (c) 2014 Gopal Erinjippurath. All rights reserved.
//

#import "SecondViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface SecondViewController ()

@end


@implementation SecondViewController {
    GMSMapView *mapView;
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    if (latitude_val != 0.0000 && longitude_val != 0.0000)
    {
    NSLog(@"didUpdateToLocation within main VC to: %.4f. %.4f", latitude_val, longitude_val);
    
    CLLocationCoordinate2D panoramaNear = {37.792835, -122.42952989};
    //CLLocationCoordinate2D panoramaNear = {latitude_val, longitude_val};
    
    GMSPanoramaView *panoView = [GMSPanoramaView panoramaWithFrame:CGRectZero nearCoordinate:panoramaNear];
    
    self.view = panoView;
    
    [locationManager stopUpdatingLocation];

    }
    
    /*
    float latitude_val = [_current_latitude floatValue];
    float longitude_val = [_current_longitude floatValue];
    
    [locationManager stopUpdatingLocation];
    
    NSLog(@"didUpdateToLocation within main VC to: %.4f. %.4f", latitude_val, longitude_val);

    //CLLocationCoordinate2D panoramaNear = {37.792835, -122.42952989};
    CLLocationCoordinate2D panoramaNear = {latitude_val, longitude_val};
     
    GMSPanoramaView *panoView = [GMSPanoramaView panoramaWithFrame:CGRectZero nearCoordinate:panoramaNear];
    
    self.view = panoView;
 */
    
/*
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude_val
                                                            longitude:longitude_val
                                                                 zoom:16];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(+37.77005, -122.40644);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView;
 */
    
}


@synthesize latitudeLabel;
@synthesize longitudeLabel;

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        latitude_val = currentLocation.coordinate.latitude;
        longitude_val = currentLocation.coordinate.longitude;
        NSLog(@"didUpdateToLocation within main to: %.4f, %.4f", latitude_val, longitude_val);
        
    }
    
    
    
    [locationManager stopUpdatingLocation];

    
    //aded to update location just once. We can change this to update once every N seconds
    //[locationManager stopUpdatingLocation];
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

