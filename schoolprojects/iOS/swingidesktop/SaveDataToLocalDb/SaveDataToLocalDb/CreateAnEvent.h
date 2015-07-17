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


@property(nonatomic,strong)RootViewController *rootVC;
@property(nonatomic,strong)UIButton *save;
@property(nonatomic,strong)UITextField *Title;
@property(nonatomic,strong)UITextField *Description;
@property(nonatomic,strong)UITextField *Date;
@property(nonatomic,strong)UITextField *StartTime;
@property(nonatomic,strong)UITextField *EndTime;
@property(nonatomic,strong)UILabel *Response;
@property(nonatomic,strong)UITextField *userID;

-(IBAction)OnSave:(id)sender;
//-(IBAction)OnAlert:(id)sender;

@end
