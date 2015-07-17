//
//  EventTableAppDelegate.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    UINavigationController *navigationController;
    
    NSMutableArray *events;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) NSMutableArray *events;

@end
