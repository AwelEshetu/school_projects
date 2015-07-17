
#import "SetalarmViewController.h"
#import "EventTableAppDelegate.h"

@implementation SetalarmViewController

@synthesize reminderText;
@synthesize detailText;
@synthesize setButton;
@synthesize clearButton;
@synthesize datePicker;
@synthesize Evc;
@synthesize aEvent;


- (void)viewDidLoad {
	
    datePicker.date=[NSDate date];
	reminderText.delegate = self;
    detailText.delegate = self;
    
}

- (void)viewDidUnload {
	
	[super viewDidUnload];
	self.reminderText = nil;
    self.detailText = nil;
	self.clearButton = nil;
	self.setButton = nil;
	self.datePicker = nil;
}



- (void)dealloc {
	[reminderText release];
    [detailText release];
	[clearButton release];
	[setButton release];
	[datePicker release];
    [Evc release];
    [aEvent release];
    [super dealloc];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}


- (void)clearNotification {
	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)scheduleNotification {
	
	[reminderText resignFirstResponder];
    [detailText resignFirstResponder];
    
    //allocate and initialize uilocalnotification
    UILocalNotification *notif = [[UILocalNotification alloc] init];
    //set the localnotification to show the alarm at the time selected from datepicker
    notif.fireDate = [datePicker date];
    
    notif.timeZone = [NSTimeZone defaultTimeZone];
    //set the title text to be the alarm message
    notif.alertBody = reminderText.text;
    
    //set notifications button text
    notif.alertAction = @"Whats up?";
    //set what sound alarm plays
    notif.soundName = UILocalNotificationDefaultSoundName;
    //add a small number 1 to application icon when notification is received
    notif.applicationIconBadgeNumber = 1;
    //Throw the description to nsdictionary
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:detailText.text forKey:keyForNotification];
    //set the notification userinfo to contain the nsdictionary
    notif.userInfo = userDict;
    //really set up the alarm with previous given information
    [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    
    [notif release];
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"Alarm has been set"
                                                   delegate:self cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    
    
    
    
    
}




@end
