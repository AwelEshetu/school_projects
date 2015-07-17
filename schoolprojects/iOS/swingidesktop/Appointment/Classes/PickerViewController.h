//
//  PickerViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 5/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreatAppoinmentViewController.h"

@interface PickerViewController : UIViewController<UIPickerViewDelegate> {
	IBOutlet UIDatePicker *StartDatePicker;
	CreatAppoinmentViewController *caVC;
	IBOutlet UILabel *StartD;
	
}
-(IBAction)Save:(id)Sender;

@property (nonatomic, retain)UIDatePicker *StartDatePicker;
@property (nonatomic, retain)UILabel *StartD;
@property (nonatomic, retain)CreatAppoinmentViewController *caVC;


@end
