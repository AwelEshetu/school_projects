//
//  EventViewController.m
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventViewController.h"
#import "Event.h"
#import "EventTableAppDelegate.h"
#import "SetalarmViewController.h"


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
            
            /*
            
            NSLog(@"STAMP: %@",aEvent.date);
            
            UILocalNotification *notif = [[UILocalNotification alloc]init];
            [[UIApplication sharedApplication] cancelAllLocalNotifications];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            dateFromString = [dateFormatter dateFromString:aEvent.date];
            
            
            
            notif.fireDate=dateFromString;
            notif.timeZone = [NSTimeZone defaultTimeZone];
            NSLog(@"FIREDATE: %@",notif.fireDate);
            notif.alertBody = aEvent.title;
            NSLog(@"ALERTBODY: %@",notif.alertBody);
            notif.alertAction = @"Whats up?";
            notif.soundName = UILocalNotificationDefaultSoundName;
            notif.applicationIconBadgeNumber = 1;
            NSDictionary *userDict = [NSDictionary dictionaryWithObject:aEvent.description forKey:keyForNotification];
            notif.userInfo = userDict;
            [[UIApplication sharedApplication] scheduleLocalNotification:notif];
//            [[UIApplication sharedApplication] presentLocalNotificationNow:notif];
            [notif release];
            [dateFormatter release];
             
            */
            
            
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
//- (void)showReminder:(NSString *)text {
//	
//	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
//                                                        message:text delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//	[alertView show];
//	[alertView release];
//}



-(void)setalarmbutton:(UIBarButtonItem *)sender{
    
   /*
    NSLog(@"begin editing");
	PickerViewController *pickerViewController = [[PickerViewController alloc] initWithNibName:@"PickerViewController" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
	pickerViewController.caVC = self;
	
    [self.navigationController pushViewController:pickerViewController animated:YES];
    [pickerViewController release];
    */
    
    SetalarmViewController *setalarmviewcontroller = [[SetalarmViewController alloc]initWithNibName:@"SetalarmViewController" bundle:nil];
    
    setalarmviewcontroller.Evc=self;
    
    [self.navigationController pushViewController:setalarmviewcontroller animated:YES];
    [setalarmviewcontroller release];
    
    
    
    
    /*
    //THE ALARM POP'S UP IMMEDIATELY IF THE DATE IS IN THE PAST!
    //allocate and initialize the uilocalnotification
    UILocalNotification *notif = [[UILocalNotification alloc]init];
    //cancel all previous notifications
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    //allocate and initialize nsdateformatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //set the dateformatter use right format of time
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //aEvent.date is a string and needs to be formatted to nsdate
    dateFromString = [dateFormatter dateFromString:aEvent.date];
    
    
    //use the formatted date to make the firedate (when notification is shown)
    notif.fireDate=dateFromString;
    //
    notif.timeZone = [NSTimeZone defaultTimeZone];
    NSLog(@"FIREDATE: %@",notif.fireDate);
    //set the event.title to be the notifications message
    notif.alertBody = aEvent.title;
    NSLog(@"ALERTBODY: %@",notif.alertBody);
    //set notifications button text
    notif.alertAction = @"Whats up?";
    //set the alarm sound
    notif.soundName = UILocalNotificationDefaultSoundName;
    //add a small number 1 to application icon when notification is received
    notif.applicationIconBadgeNumber = 1;
    //Throw the description to nsdictionary
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:aEvent.description forKey:keyForNotification];
    //set the notification userinfo to contain the nsdictionary
    notif.userInfo = userDict;
    //really set up the alarm with previous given information
    [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    //            [[UIApplication sharedApplication] presentLocalNotificationNow:notif];
    
    //we dont need these after the notification is set
    [notif release];
    [dateFormatter release];
    */
}

//-(void)showReminder:(NSString *)text{
//    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Reminder" 
//                                                        message:text delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//	[alertView show];
//	[alertView release];
//    
//}

- (void)dealloc {
	
	[aEvent release];
	[tableView release];
    [super dealloc];
}



@end
