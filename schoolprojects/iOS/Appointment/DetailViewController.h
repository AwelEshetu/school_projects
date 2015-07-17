//
//  DetailViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface DetailViewController : UIViewController {
	IBOutlet UILabel *FirstNameV;
	IBOutlet UILabel *SecondNameV;
	IBOutlet UILabel *ProfessionV;
	IBOutlet UILabel *topicV;
	IBOutlet UILabel *whereV;
	IBOutlet UILabel *phoneV;
	IBOutlet UILabel *emailV;
	IBOutlet UILabel *startDateV;
	IBOutlet UILabel *endDateV;
	IBOutlet UILabel *alertV;
	IBOutlet UILabel *timeleft;
	IBOutlet UILabel *startdate;
	IBOutlet UILabel *starttime;
	NSString *Hours;
	NSString *Alert;
	RootViewController *rootVC;
	

}
@property (nonatomic, retain)UILabel *FirstNameV;
@property (nonatomic, retain)UILabel *SecondNameV;
@property (nonatomic, retain)UILabel *ProfessionV;
@property (nonatomic, retain)UILabel *topicV;
@property (nonatomic, retain)UILabel *phoneV;
@property (nonatomic, retain)UILabel *startDateV;
@property (nonatomic, retain)UILabel *endDateV;
@property (nonatomic, retain)UILabel *alertV;
@property (nonatomic, retain)UILabel *timeleft;
@property (nonatomic, retain)UILabel *whereV;
@property (nonatomic, retain)UILabel *emailV;
@property (nonatomic, retain)RootViewController *rootVC;
@property (nonatomic, retain)UILabel *startdate;
@property (nonatomic, retain)UILabel *starttime;
@property (nonatomic, retain)NSString *Hours;
@property (nonatomic, retain)NSString *Alert;

// my API KEY-----ABQIAAAAtYBnBxIEj8f4-JcRfae6CxQz1JRsiS91Da6GA_8080SVI2d1wRSVefFxEbEbtYMurfVRU_mnuV539Q
-(IBAction)ShowLocation:(id)sender;

@end
