//
//  LocationViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 5/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LocationViewController.h"


@implementation LocationViewController
@synthesize longitude, latitude, horizontalAccuracy, verticalAccuracy, altitude, distance;
@synthesize locationManager, startLocation;
@synthesize dVC;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    startLocation = nil;
    [super viewDidLoad];
	
    [super viewDidLoad];
}
-(void)resetDistance
{
	startLocation = nil;
}
#pragma mark -
#pragma mark CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
		  fromLocation:(CLLocation *)oldLocation
{
	NSString *currentLatitude = [[NSString alloc] initWithFormat:@"%g", 
								 newLocation.coordinate.latitude];
	latitude.text = currentLatitude;
	
	NSString *currentLongitude = [[NSString alloc] initWithFormat:@"%g",
								  newLocation.coordinate.longitude];
	longitude.text = currentLongitude;
	
	NSString *currentHorizontalAccuracy = [[NSString alloc] 
										   initWithFormat:@"%g",
										   newLocation.horizontalAccuracy];
	horizontalAccuracy.text = currentHorizontalAccuracy;
	
	NSString *currentAltitude = [[NSString alloc] initWithFormat:@"%g",                                                          
								 newLocation.altitude];
	altitude.text = currentAltitude;
	[currentAltitude release];
	
	NSString *currentVerticalAccuracy = [[NSString alloc] 
										 initWithFormat:@"%g",
										 newLocation.verticalAccuracy];
	verticalAccuracy.text = currentVerticalAccuracy;
	
	if (startLocation == nil)
		self.startLocation = newLocation;
	
	CLLocationDistance distanceBetween = [newLocation
										  distanceFromLocation:startLocation];
	
	NSString *tripString = [[NSString alloc] 
							initWithFormat:@"%f", 
							distanceBetween];
	distance.text = tripString;
	
	[currentLatitude release];
	[currentLongitude release];
	[currentHorizontalAccuracy release];
	[currentVerticalAccuracy release];
	[tripString release];
}






-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.latitude = nil;
	self.longitude = nil;
	self.horizontalAccuracy = nil;
	self.verticalAccuracy = nil;
	self.altitude = nil;
	self.startLocation = nil;
	self.distance = nil;
	self.locationManager = nil;
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[latitude release];
	[longitude release];
	[horizontalAccuracy release];
	[verticalAccuracy release];
	[altitude release];
	[startLocation release];
	[distance release];
	[locationManager release];
	[dVC release];
	
    [super dealloc];
}


@end
