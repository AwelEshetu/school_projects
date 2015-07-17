//
//  CreateAnEvent.h
//  SaveDataToLocalDb
//
//  Created by iosdev on 10/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface CreateAnEvent : UIViewController<UIActionSheetDelegate>
{
    IBOutlet UITextField *Title;
    IBOutlet UITextField *Description;
    IBOutlet UITextField *Date;
    IBOutlet UITextField *StartTime;
    IBOutlet UITextField *EndTime;
    IBOutlet UITextField *userID;
    IBOutlet UILabel *Response;
    IBOutlet UIButton *save;
    
    RootViewController *rootVC;

}


@property(nonatomic,retain)RootViewController *rootVC;
@property(nonatomic,retain)UIButton *save;
@property(nonatomic,retain)UITextField *Title;
@property(nonatomic,retain)UITextField *Description;
@property(nonatomic,retain)UITextField *Date;
@property(nonatomic,retain)UITextField *StartTime;
@property(nonatomic,retain)UITextField *EndTime;
@property(nonatomic,retain)UILabel *Response;
@property(nonatomic,retain)UITextField *userID;

-(IBAction)OnSave:(id)sender;
//-(IBAction)OnAlert:(id)sender;

@end
