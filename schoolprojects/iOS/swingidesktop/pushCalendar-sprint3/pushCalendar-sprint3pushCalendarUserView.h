//
//  UserView.h
//  pushCalendar
//
//  Created by iosdev on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserView : UIViewController
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
}

-(IBAction) back;
-(IBAction)createAccount;

@property (nonatomic ,strong) UITextField *email; 
@property (nonatomic ,strong) UITextField *password; 

@end
