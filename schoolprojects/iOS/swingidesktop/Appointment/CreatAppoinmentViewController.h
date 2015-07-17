//
//  CreatAppoinmentViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface CreatAppoinmentViewController : UIViewController<UIPickerViewDelegate,UIActionSheetDelegate> {
	
	IBOutlet UITextField *firstName;
	IBOutlet UITextField *lastName;
	IBOutlet UITextField *profession;
	IBOutlet UITextField *topic;
	IBOutlet UITextField *where;
	IBOutlet UITextField *phone;
	IBOutlet UITextField *email;
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIDatePicker *datePickerS;
	IBOutlet UIDatePicker *datePickerE;
	IBOutlet UILabel *Alert;
	IBOutlet UIButton *Save;
	IBOutlet UILabel *dateLabelS;
	IBOutlet UILabel *dateLabelE;
	//IBOutlet UIView *myView;
	IBOutlet UILabel *startDateDB;
	IBOutlet UILabel *endDateDB;
	IBOutlet UILabel *startTimeDB;
	IBOutlet UILabel *endTimeDB;
	
	
	
	
	RootViewController *rootVC;

}
@property (nonatomic,retain)RootViewController *rootVC;

@property (nonatomic,retain)UITextField *firstName;
@property (nonatomic,retain)UITextField *lastName;
@property (nonatomic,retain)UITextField *profession;
@property (nonatomic,retain)UITextField *topic;
@property (nonatomic,retain)UITextField *where;
@property (nonatomic,retain)UITextField *phone;
@property (nonatomic,retain)UITextField *email;
@property (nonatomic,retain)UIButton *Save;
@property (nonatomic,retain)UIDatePicker *datePickerS;
@property (nonatomic,retain)UIDatePicker *datePickerE;
@property (nonatomic,retain)UILabel *Alert;
@property (nonatomic, retain)UIScrollView *scrollView;
@property (nonatomic, retain) UILabel *dateLabelS;
@property (nonatomic, retain)UILabel *dateLabelE;
//@property (nonatomic, retain)UIView *myView;
@property (nonatomic,retain) UILabel *startDateDB;
@property (nonatomic,retain) UILabel *endDateDB;
@property (nonatomic,retain) UILabel *startTimeDB;
@property (nonatomic, retain) UILabel *endTimeDB;




-(IBAction) OnSave:(id)sender;
-(IBAction) SelectS:(id)sender;
-(IBAction) SelectE:(id)sender;

-(IBAction) OnAlert:(id) sender;




@end
