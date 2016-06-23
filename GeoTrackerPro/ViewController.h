//
//  ViewController.h
//  GeoTrackerPro
//
//  Created by Gopal Erinjippurath on 3/7/14.
//  Copyright (c) 2014 Gopal Erinjippurath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SecondViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)getCurrentLocation:(id)sender;
- (IBAction)MapLocation:(id)sender;

@end
