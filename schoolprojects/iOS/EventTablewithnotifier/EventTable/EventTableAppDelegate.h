//
//  EventTableAppDelegate.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventViewController;

@interface EventTableAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    UINavigationController *navigationController;
    
    EventViewController *EviewController;
    
    NSMutableArray *events;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EventViewController *EviewController;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *events;
extern NSString *keyForNotification;
- (void)showReminder:(NSString *)text;
@end
