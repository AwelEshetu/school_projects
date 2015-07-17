//
//  EndPickerViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 5/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreatAppoinmentViewController.h"


@interface EndPickerViewController : UIViewController<UIPickerViewDelegate> {
	IBOutlet UIDatePicker *EndDatePicker;
	CreatAppoinmentViewController *CAvc;
	IBOutlet UILabel *EndD;

}
-(IBAction) Save:(id)Sender;
@property (nonatomic, retain)UIDatePicker *EndDatePicker;
@property (nonatomic, retain) UILabel *EndD;
@property (nonatomic, retain) CreatAppoinmentViewController *CAvc;

@end
