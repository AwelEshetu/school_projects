//
//  CreatAppoinmentViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreatAppoinmentViewController.h"
#import "Event.h"
#import "PickerViewController.h"
#import "EndPickerViewController.h"
#import "TableViewController.h"

@implementation CreatAppoinmentViewController
//UIDatePicker *datePicker;


@synthesize rootVC;

@synthesize firstName;
@synthesize lastName;
@synthesize profession;
@synthesize topic;
@synthesize where;
@synthesize phone;
@synthesize email;

@synthesize datePickerS;
@synthesize datePickerE;
@synthesize Alert;
@synthesize Save;

@synthesize scrollView;
@synthesize dateLabelS, dateLabelE;
@synthesize endTimeDB;
@synthesize startDateDB;
@synthesize endDateDB;
@synthesize startTimeDB;

//@synthesize myView;






-(IBAction)OnSave:(id) sender{
	
	NSLog(@"Save data");
	
	
	/*//saving first name last name and Alert on root view
	self.rootVC.firstN = firstName.text;
	self.rootVC.lastN = lastName.text;
	self.rootVC.professionN = profession.text;
	self.rootVC.topicN = topic.text;
	self.rootVC.whereN = where.text;
	self.rootVC.phoneN = phone.text;
	self.rootVC.emailN = email.text;
	self.rootVC.startT = dateLabelS.text;
	self.rootVC.endT = dateLabelE.text;
	//self.rootVC.alertN=*/
	NSLog(@"%@",startDateDB.text);
	NSLog(@"%@",endDateDB.text);
	NSLog(@"%@",startTimeDB.text);
	NSLog(@"%@",endTimeDB.text);
	
	NSDictionary *object = [NSDictionary dictionaryWithObjectsAndKeys:firstName.text, @"FIRST_NAME",
																	lastName.text, @"LAST_NAME", 
																	profession.text, @"PROFESSION", 
																	topic.text, @"TOPIC", 
																	where.text, @"WHERE", 
																	phone.text, @"PHONE",
																	email.text, @"EMAIL", 
																	dateLabelS.text, @"START_DATE", 
																	dateLabelE.text, @"END_DATE",
																	startDateDB.text, @"STARTDATE",
																	startTimeDB.text,@"STARTTIME",
																	endDateDB.text,@"ENDDATE",
																	endTimeDB.text,@"ENDTIME",
																	Alert.text, @"ALERT", nil];
	
	[self.rootVC saveObject:object];
	UIAlertView *alert = 
	[[UIAlertView alloc] initWithTitle:@"Appointment Saved" 
							   message:@"Sucessfuly Saved" 
							  delegate:self 
					 cancelButtonTitle:@"OK" 
					 otherButtonTitles:nil];    
    
    [alert show];     
    [alert release];
	
	
	
}

  
-(IBAction)OnAlert:(id) sender{
	TableViewController *tableViewController = [[TableViewController alloc] initWithNibName:nil bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
	
	//tableViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	//[self presentModalViewController: tableViewController  animated:YES];
	
	tableViewController.tcVC = self;
    [self.navigationController pushViewController:tableViewController animated:YES];
	//[self.modalTransitionStyle presentModalViewController: tableViewController animated:YES];
    [tableViewController release];
	
	
}

-(IBAction) SelectS:(id)sender{
	NSLog(@"begin editing");
	PickerViewController *pickerViewController = [[PickerViewController alloc] initWithNibName:@"PickerViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
	pickerViewController.caVC = self;
	
    [self.navigationController pushViewController:pickerViewController animated:YES];
    [pickerViewController release];
	
	
}
-(IBAction) SelectE:(id)sender{
	NSLog(@"begin editing");
	EndPickerViewController *pickerViewController1 = [[EndPickerViewController alloc] initWithNibName:@"EndPickerViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
	pickerViewController1.CAvc = self;
	
    [self.navigationController pushViewController:pickerViewController1 animated:YES];
    [pickerViewController1 release];
	
	
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
	self.title = @"Creat/Modify";
	[scrollView setScrollEnabled:YES];
	[scrollView setContentSize:CGSizeMake(320, 800)];
	//datePickerE.frame = CGRectMake(0,455, 310,100);
	//datePickerS.frame = CGRectMake(0,235, 310,100);
	
    [super viewDidLoad];
}

- (void) update:(Event*)entity {
	firstName.text = [entity valueForKey:@"FIRST_NAME"];
	
	NSLog(@"%@", [entity valueForKey:@"FIRST_NAME"]);
	//lastName.text = @"asdasdasd";
	lastName.text = [entity valueForKey:@"LAST_NAME"];
	profession.text=[entity valueForKey: @"PROFESSION"]; 
	topic.text=[entity valueForKey: @"TOPIC"]; 
	where.text=[entity valueForKey: @"WHERE"]; 
	phone.text=[entity valueForKey: @"PHONE"];
	email.text= [entity valueForKey: @"EMAIL"]; 
	dateLabelS.text=[entity valueForKey: @"START_DATE"]; 
	dateLabelE.text= [entity valueForKey: @"END_DATE"];
	Alert.text= [entity valueForKey: @"ALERT"];
	
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
    
	[firstName release];
	[lastName release];
	[profession release];
	[topic release];
	[datePickerE release];
	[datePickerS release];
	[dateLabelS release];
	[dateLabelE release];
	[startDateDB release];
	[startTimeDB release];
	[endDateDB release];
	[endTimeDB release];
	[where release];
	[phone release];
	[email release];
	[Alert release];
	[rootVC release];
	[super dealloc];
	
}


@end
