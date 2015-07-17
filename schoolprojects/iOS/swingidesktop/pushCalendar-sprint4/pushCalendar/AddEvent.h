//
//  AddEvent.h
//  pushCalendar
//
//  Created by iosdev on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DatePickView;
@class RepeatEvent;

@interface AddEvent : UIViewController<NSXMLParserDelegate>
{
    IBOutlet UIScrollView *AddEventScrollview;
    IBOutlet DatePickView *datepickview;
    IBOutlet RepeatEvent *repeatevent;
    
    IBOutlet UITextField *titleText;
    IBOutlet UITextField *descripText;
    IBOutlet UITextField *dateText;
    IBOutlet UITextField *timeText;
    IBOutlet UITextField *startTimeText;
    IBOutlet UITextField *endTimeText;
    IBOutlet UILabel *Response;
    
    
    
    NSString *serverResponse;
    NSString *title;
    NSString *description;
    NSString *eventDate;
    NSString *eventStartTime;
    NSString *eventEndTime;
    
    
    NSMutableString *foundString;
    NSMutableData *receivedData;
    
    
}

-(IBAction) back;
-(IBAction)pickdate;
-(IBAction)sendData:(id)sender;
-(IBAction)removeKeyboard:(id)sender;
- (void)parseData:(NSData *)data;
-(IBAction)repeatevent;

@property (nonatomic ,strong) UITextField *titleText; 
@property (nonatomic ,strong) UITextField *descripText; 
@property (nonatomic ,strong) UITextField *dateText;
@property (nonatomic ,strong) UITextField *startTimeText;
@property (nonatomic ,strong) UITextField *endTimeText;
@property (nonatomic,strong)NSMutableString *foundString;
@property (nonatomic ,strong) NSMutableData *receivedData;

@end
