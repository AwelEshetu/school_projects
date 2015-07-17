//
//  pushCalendarViewController.m
//  pushCalendar
//
//  Created by iosdev on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "pushCalendarViewController.h"
#import "AddEvent.h"
#import "DetailedView.h"
#import "UserView.h"
#import "JourneyPlanner.h"
#import "AddLocation.h"
#import "ListingView.h"
#import "RepeatEvent.h"


@implementation pushCalendarViewController

-(IBAction)addevent
{
    addevent.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:addevent animated:YES];
}

-(IBAction)addlocation
{
    addlocation.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:addlocation animated:YES];
}

-(IBAction)detailedview
{
    detailedview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:detailedview animated:YES];
}

-(IBAction)userview
{
    userview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:userview animated:YES];
}

-(IBAction)journeyplanner
{
    journeyplanner.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:journeyplanner animated:YES];
}

-(IBAction)listingview
{
    listingview.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:listingview animated:YES];
}




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

@end
