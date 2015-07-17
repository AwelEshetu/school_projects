

#import <UIKit/UIKit.h>
//#import "EventViewController.h"
@class EventViewController;
@class Event;
@interface SetalarmViewController : UIViewController <UITextFieldDelegate> {
    
    Event *aEvent;
    EventViewController *Evc;
	UITextField *reminderText;
    UITextField *detailText;
	UIButton *setButton;
	UIButton *clearButton;
	UIDatePicker *datePicker;
}

@property (nonatomic,retain) IBOutlet UITextField *reminderText;
@property (nonatomic,retain) IBOutlet UITextField *detailText;
@property (nonatomic,retain) IBOutlet UIButton *setButton;
@property (nonatomic,retain) IBOutlet UIButton *clearButton;
@property (nonatomic,retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic,retain) EventViewController *Evc;
@property (nonatomic,retain) Event *aEvent;

- (IBAction)clearNotification;
- (IBAction)scheduleNotification;

@end

