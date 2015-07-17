//
//  RootViewController.h
//  Appointment
//
//  Created by Dinesh Sapkota on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	NSString *firstN;
	NSString *lastN;
	NSString *professionN;
	NSString *whereN;
	NSString *phoneN;
	NSString *emailN;
	NSString *startT;
	NSString *starTime;
	NSString *starDate;
	NSString *enTime;
	NSString *enDate;
	NSString *endT;
	NSString *alertN;
	NSString *topicN;

@private
    NSFetchedResultsController *fetchedResultsController_;
    NSManagedObjectContext *managedObjectContext_;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSString *firstN;
@property (nonatomic, retain) NSString *lastN;
@property (nonatomic, retain) NSString *professionN;
@property (nonatomic, retain) NSString *whereN;
@property (nonatomic, retain) NSString *emailN;
@property (nonatomic, retain) NSString *startT;
@property (nonatomic, retain) NSString *endT;
@property (nonatomic, retain) NSString *alertN;
@property (nonatomic, retain) NSString *topicN;
@property (nonatomic, retain) NSString *phoneN;
@property (nonatomic, retain) NSString *starTime;
@property (nonatomic, retain) NSString *starDate;
@property (nonatomic, retain) NSString *enTime;
@property (nonatomic, retain) NSString *enDate;


-(void)insertNewObject;
- (void) saveObject:(NSDictionary*)dict;
- (void)insertNewObject:(NSDictionary*)object;

@end
