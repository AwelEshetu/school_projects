//
//  LocationViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DetailViewController.h"


@interface LocationViewController : UIViewController <CLLocationManagerDelegate> {
	
	CLLocationManager *locationManager;
	
	UILabel *latitude;
	UILabel *longitude;
	UILabel *horizontalAccuracy;
	UILabel *altitude;
	UILabel *verticalAccuracy;
	UILabel *distance;
	UIButton *resetButton;
	CLLocation *startLocation;
	DetailViewController *dVC;
	
}
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet UILabel *latitude;
@property (nonatomic, retain) IBOutlet UILabel *longitude;
@property (nonatomic, retain) IBOutlet UILabel *horizontalAccuracy;
@property (nonatomic, retain) IBOutlet UILabel *verticalAccuracy;
@property (nonatomic, retain) IBOutlet UILabel *altitude;
@property (nonatomic, retain) IBOutlet UILabel *distance;
@property (nonatomic, retain) CLLocation *startLocation;
@property (nonatomic, retain) DetailViewController *dVC;

-(IBAction)resetDistance;



@end
