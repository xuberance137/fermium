//
//  SecondViewController.h
//  GeoTrackerPro
//
//  Created by Gopal Erinjippurath on 3/7/14.
//  Copyright (c) 2014 Gopal Erinjippurath. All rights reserved.
//

#import <UIKit/UIKit.h>

float latitude_val;
float longitude_val;

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSString *current_latitude;
@property (strong, nonatomic) NSString *current_longitude;

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

@end
