//
//  RootViewController.h
//  SaveDataToLocalDb
//
//  Created by iosdev on 10/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;


-(void)insertNewObject;
- (void) saveObject:(NSDictionary*)dict;
- (void)insertNewObject:(NSDictionary*)MyEvent;

@end
