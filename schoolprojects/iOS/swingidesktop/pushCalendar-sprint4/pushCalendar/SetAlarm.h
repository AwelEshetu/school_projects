//
//  SetAlarm.h
//  pushCalendar
//
//  Created by iosdev on 11/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetAlarm : UIViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *reminderText;
    IBOutlet UITextField *detailText;
	IBOutlet UIButton *setButton;
	IBOutlet UIButton *clearButton;
	IBOutlet UIDatePicker *datePicker;
        
}



@property (nonatomic,strong) UITextField *reminderText;
@property (nonatomic,strong) UITextField *detailText;
@property (nonatomic,strong) IBOutlet UIButton *setButton;
@property (nonatomic,strong) IBOutlet UIButton *clearButton;
@property (nonatomic,strong) IBOutlet UIDatePicker *datePicker;



-(IBAction) back;
- (IBAction)clearNotification;
- (IBAction)scheduleNotification;



@end
