//
//  CreateAnEvent.m
//  SaveDataToLocalDb
//
//  Created by iosdev on 10/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CreateAnEvent.h"
#import "Event.h"
@implementation CreateAnEvent

@synthesize rootVC;
@synthesize Title;
@synthesize Date;
@synthesize Description;
@synthesize save;
@synthesize StartTime;
@synthesize EndTime;
@synthesize Response;
@synthesize userID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//saving object to MyEvent dictionary.

-(IBAction)OnSave:(id)sender{
        NSDictionary *MyEvent =[NSDictionary dictionaryWithObjectsAndKeys:Title.text,@"Title",
                            Description.text,@"Description",
                            EndTime.text,@"EndTime",
                            StartTime.text,@"StartTime",
                            Date.text,@"Date",
                            userID.text,@"userID",nil];
                           
    [self.rootVC saveObject:MyEvent];
    //NSLog(@"Data Saved");
   /* UIAlertView *alert = 
	[[UIAlertView alloc] initWithTitle:@"Appointment Saved" 
							   message:@"Sucessfuly Saved" 
							  delegate:self 
					 cancelButtonTitle:@"OK" 
					 otherButtonTitles:nil];    
    
    [alert show];     
    [alert release];*/
    
}

/*-(void)update:(Event *)entity{
    
    Title.text=[entity valueForKey:@"Title"];
    Description.text=[entity valueForKey:@"Description"];
    Date.text=[entity valueForKey:@"Date"];
    StartTime.text=[entity valueForKey:@"StartTime"];
    EndTime.text=[entity valueForKey:@"EndTime"];
    userID.text=[entity valueForKey:@"userID"];
   // Response.text=[entity valueForKey:@"Response"];
    
} */

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
    //self.title = @"Creat/Modify";
    // Do any additional setup after loading the view from its nib.
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

@end
