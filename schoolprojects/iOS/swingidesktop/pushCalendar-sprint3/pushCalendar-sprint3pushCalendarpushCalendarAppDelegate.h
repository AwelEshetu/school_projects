//
//  pushCalendarAppDelegate.h
//  pushCalendar
//
//  Created by iosdev on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pushCalendarViewController,Event;


@interface pushCalendarAppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    //UINavigationController *navigationController;
    //DetailViewController *detailViewController;
    NSMutableArray *arrayID;
}



@property (nonatomic, strong) IBOutlet UIWindow *window;

@property (nonatomic, strong) IBOutlet pushCalendarViewController *viewController;

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@property (nonatomic, strong) NSMutableArray *arrayID;

extern NSString *keyForNotification;

@end
