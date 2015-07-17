//
//  EventViewController.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetalarmViewController.h"

@class Event;

@interface EventViewController : UIViewController{
    IBOutlet UITableView *tableView;
    IBOutlet UIToolbar *toolbar;
    
    
	
	Event *aEvent;
    NSDate *dateFromString;
}

@property (nonatomic, retain) Event *aEvent;
//-(void)showReminder:(NSString *)text;
-(IBAction)setalarmbutton:(UIBarButtonItem *)sender;

@end
