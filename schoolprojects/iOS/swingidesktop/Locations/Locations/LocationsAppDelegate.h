//
//  LocationsAppDelegate.h
//  Locations
//
//  Created by iosdev on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationsAppDelegate : NSObject <UIApplicationDelegate>
{
    UINavigationController *navigationController; 
}
@property (nonatomic,retain) UINavigationController *navigationController;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
