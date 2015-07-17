//
//  EventViewController.m
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "Event.h"

@implementation EventViewController
@synthesize aEvent;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.title = @"Events Detail";
    
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[tableView reloadData];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	switch(indexPath.section)
	{
		case 0:
			cell.textLabel.text = aEvent.title;
			break;
		case 1:
			cell.textLabel.text = aEvent.description;
			break;
		case 2:
			cell.textLabel.text = aEvent.date;
			break;
    
        case 3:
			cell.textLabel.text = aEvent.stamp;
			break;
        
	}
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tblView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = nil;
	
	switch(section)
	{
		case 0:
			sectionName = [NSString stringWithString:@"Title"];
			break;
		case 1:
			sectionName = [NSString stringWithString:@"Description"];
			break;
		case 2:
			sectionName = [NSString stringWithString:@"Date"];
			break;
        case 3:
			sectionName = [NSString stringWithString:@"Time"];
			break;
	}
	
	return sectionName;
}
- (void)dealloc {
	
	[aEvent release];
	[tableView release];
    [super dealloc];
}



@end
