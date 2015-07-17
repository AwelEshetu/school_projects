//
//  PickerViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PickerViewController.h"


@implementation PickerViewController
@synthesize StartDatePicker;
@synthesize StartD;
@synthesize caVC;



-(IBAction)Save:(id)Sender{

NSLog(@"data is saved");
//saving selection of picker view in lebel
NSLocale *usLocale = [[[NSLocale alloc]
					   initWithLocaleIdentifier:@"en_US"] autorelease];

NSDate *startDate = [StartDatePicker date];
NSString *selectionString3 = [[NSString alloc] initWithFormat:@"%@",
							 [startDate descriptionWithLocale:usLocale]];
	
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"YYY-MM-dd"];
	
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH:mm:ss"];
	
	NSString *theSDate = [dateFormat stringFromDate:startDate];
	NSString *theSTime = [timeFormat stringFromDate:startDate];
	
	NSLog(@"\n"
		  
          "theSDate: |%@| \n"
          "theSTime: |%@| \n"
          , theSDate, theSTime);
	
	[dateFormat release];
	[timeFormat release];
	
	caVC.startDateDB.text = theSDate;
	caVC.startTimeDB.text = theSTime;
	
	StartD.text = @"Start Date Saved";
	//caVC.dateLabelS.text = StartD.text;
	caVC.dateLabelS.text = [NSString stringWithFormat:@"%@ %@", theSDate, theSTime];
	
	NSLog(@" value in cAV%@",caVC.dateLabelS.text);
	UIAlertView *alert = 
	[[UIAlertView alloc] initWithTitle:@"Start Date/Time Selected" 
							   message:selectionString3 
							  delegate:self 
					 cancelButtonTitle:@"OK" 
					 otherButtonTitles:nil];    
    
    [alert show];     
    [alert release];
    
		
[selectionString3 release];
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
	self.title = @"Start Time";
    [super viewDidLoad];
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
	[caVC release];
	[StartDatePicker release];
	[StartD release];
    [super dealloc];
}


@end
