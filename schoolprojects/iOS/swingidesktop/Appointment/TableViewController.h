//
//  TableViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreatAppoinmentViewController.h"


@interface TableViewController : UIViewController {
	NSArray *timeAlert;
	
	CreatAppoinmentViewController *tcVC;
	
	
}
@property (nonatomic, retain) NSArray *timeAlert;
@property (nonatomic, retain)CreatAppoinmentViewController *tcVC;
 


@end
