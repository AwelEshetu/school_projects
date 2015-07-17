//
//  DetailViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"
#import "LocationViewController.h"
#import "AppointmentAppDelegate.h"

@implementation DetailViewController
@synthesize rootVC;
@synthesize FirstNameV;
@synthesize SecondNameV;
@synthesize ProfessionV;
@synthesize topicV;
@synthesize whereV;
@synthesize phoneV;
@synthesize emailV;

@synthesize startDateV;
@synthesize endDateV;
@synthesize alertV;
@synthesize timeleft;
@synthesize startdate;
@synthesize starttime;
@synthesize Hours;
@synthesize Alert;
AppointmentAppDelegate *aAD;

-(IBAction)ShowLocation:(id)sender{
	NSLog(@"Loading Location");
	LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
	locationViewController.dVC = self;
	
    [self.navigationController pushViewController:locationViewController animated:YES];
    [locationViewController release];
}

-(int)howManyDaysHavePast:(NSDate*)lastDate today:(NSDate*)today {
	NSDate *startDate = lastDate;
	NSDate *endDate = today;
	NSCalendar *gregorian = [[NSCalendar alloc]
							 initWithCalendarIdentifier:NSGregorianCalendar];
	unsigned int unitFlags = NSDayCalendarUnit | NSHourCalendarUnit;
	NSDateComponents *components = [gregorian components:unitFlags
												fromDate:endDate
												  toDate:startDate options:0];
	int days = [components day];
	int hours = [components hour];
	NSLog(@"%d, %d", days, hours);
	NSLog(@"%@", lastDate);
	timeleft.text = [NSString stringWithFormat:@"days %d, hours %d", days, hours];
	
	Hours = [NSString stringWithFormat:@" %d hrs", hours];
	//[(AppointmentAppDelegate *)[[UIApplication sharedApplication] delegate].Hours = Hours];
	
	aAD.HOURS=Hours;
	
	
	NSLog(@"aAD HOURS %@",aAD.HOURS);
	return days;
	return hours;
}

-(void) showView:(Event*) entity{
	FirstNameV.text = [entity valueForKey:@"FIRST_NAME"];
	SecondNameV.text=[entity valueForKey:@"LAST_NAME"];
	ProfessionV.text=[entity valueForKey:@"PROFESSION"];
	topicV.text=[entity valueForKey:@"TOPIC"];
	whereV.text= [entity valueForKey:@"WHERE"];
	phoneV.text = [entity valueForKey:@"PHONE"];
	emailV.text = [entity valueForKey:@"EMAIL"];
	startDateV.text=[entity valueForKey:@"START_DATE"];
	endDateV.text = [entity valueForKey:@"END_DATE"];
	alertV.text = [entity valueForKey:@"ALERT"];
	startdate.text = [entity valueForKey:@"STARTDATE"];
	starttime.text = [entity valueForKey:@"STARTTIME"];
	
	Alert = alertV.text;
	
	aAD.ALERT=[NSString stringWithFormat:@"%@", Alert];
	
	NSLog(@"alert aAD %@",aAD.ALERT);
	NSLog(@"alert %@",Alert);
	int i = [alertV.text intValue];
	
	NSLog(@"This is the int value: %d", i);
	
	NSDate *today = [NSDate date];
	
	
	//convert string to date object 
	NSString *timeString = [NSString stringWithFormat:@"%@ %@", startdate.text, starttime.text];
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate * myDate = [df dateFromString:timeString];
	NSLog(@"%@", timeString);
	NSLog(@"%@",myDate);
	NSLog(@"%@",today);
	[df release];
		
	NSLog(@"differencr:%d",[self howManyDaysHavePast:myDate today:today]);
	
}

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
	self.title = @"View Details";
	
	NSLog(@"%@",FirstNameV.text);
	//FirstNameV.text = [Attribute valueForKey:@"FIRST_NAME"];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[FirstNameV release];
	[SecondNameV release];
	[ProfessionV release];
	[topicV release];
	[whereV release];
	[phoneV release];
	[emailV release];
	[startDateV release];
	[endDateV release];
	[alertV release];
	[startdate release];
	[starttime release];
	
    [super dealloc];
}


@end
