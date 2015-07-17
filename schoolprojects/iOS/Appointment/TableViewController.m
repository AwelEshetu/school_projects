//
//  TableViewController.m
//  Appointment
//
//  Created by Dinesh Sapkota on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController
@synthesize timeAlert;
@synthesize tcVC;



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
	self.timeAlert = [[NSArray alloc] initWithObjects:@"1", 
					   @"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12", nil];
    self.title = @"Alert Time";
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.timeAlert count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	// Configure the cell.
	 
	//cell.textLabel.text =[self.timeAlert objectAtIndex:[indexPath row]];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ hrs",[self.timeAlert objectAtIndex:[indexPath row]]];
	
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"table row selected");
    
	NSString *s =[[NSString alloc] initWithFormat:@"%@", [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text]];
	NSLog(@"String is: %@", s);
	
	tcVC.Alert.text=s;
	NSLog(@"sfsda: %@",tcVC.Alert.text);
	int i = [s intValue];
	NSLog(@"This is the int value: %d", i);
	UIAlertView *alert = 
	[[UIAlertView alloc] initWithTitle:@"Alert Time" 
							   message:s 
							  delegate:self 
					 cancelButtonTitle:@"OK" 
					 otherButtonTitles:nil];    
    
    [alert show];     
    [alert release];
    
	
	[s release];
	
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
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
	self.timeAlert = nil;
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[timeAlert release];
	[tcVC release];
    [super dealloc];
}


@end
