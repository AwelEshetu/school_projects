//
//  EndPickerViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EndPickerViewController.h"


@implementation EndPickerViewController
@synthesize EndDatePicker;
@synthesize EndD;
@synthesize CAvc;

-(IBAction)Save:(id)Sender{
	
	NSLog(@"data is saved");
	//saving selection of picker view in lebel
	NSLocale *usLocale = [[[NSLocale alloc]
						   initWithLocaleIdentifier:@"en_US"] autorelease];
	
	NSDate *startDate = [EndDatePicker date];
	NSString *selectionString4 = [[NSString alloc] initWithFormat:@"%@",
								  [startDate descriptionWithLocale:usLocale]];
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"YYY-MM-dd"];
	
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH:mm:ss"];
	
	NSString *theEDate = [[NSString alloc] initWithFormat:@"%@",[dateFormat stringFromDate:startDate]];
	NSString *theETime = [[NSString alloc] initWithFormat:@"%@",[timeFormat stringFromDate:startDate]];
	
	NSLog(@"\n"
		  
          "theEDate: |%@| \n"
          "theETime: |%@| \n"
          , theEDate, theETime);
	CAvc.endDateDB.text = theEDate;
	CAvc.endTimeDB.text = theETime;

	NSLog(@"saasas%@",CAvc.endDateDB.text);
	
	
	//EndD.text = (@"%@s""time:%@",theEDate,theETime);
	EndD.text = @"End Date Saved";
	CAvc.dateLabelE.text = [NSString stringWithFormat:@"%@ %@", theEDate, theETime];;
	 UIAlertView *alert =
	[[UIAlertView alloc] initWithTitle:@"End Date/Time Selected" 
							   message:selectionString4 
							  delegate:self 
					 cancelButtonTitle:@"OK" 
					 otherButtonTitles:nil];    
    
    [alert show];     
    [alert release];
	[dateFormat release];
	[timeFormat release];
	
	[theEDate release];
	[theETime release];
	[selectionString4 release];
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
	self.title = @"End Time";
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
	[CAvc release];
	[EndD release];
	[EndDatePicker release];
    [super dealloc];
}


@end
