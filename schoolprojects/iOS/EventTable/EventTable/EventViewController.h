//
//  EventViewController.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Event;

@interface EventViewController : UIViewController{
    IBOutlet UITableView *tableView;
	
	Event *aEvent;
}

@property (nonatomic, retain) Event *aEvent;


@end
