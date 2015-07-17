//
//  RootViewController.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventTableAppDelegate, EventViewController;

@interface RootViewController:UITableViewController{
    EventTableAppDelegate *appDelegate;
    EventViewController *eventViewController;

    
}



@end
