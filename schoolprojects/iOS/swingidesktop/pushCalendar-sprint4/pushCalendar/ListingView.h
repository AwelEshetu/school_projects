//
//  ListingView.h
//  pushCalendar
//
//  Created by iosdev on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "pushCalendarAppDelegate.h"
#import "Event.h"


@class DetailedView;
@class AddLocation;
@class UserView;
@class JourneyPlanner;
@class pushCalendarViewController;
@class XMLParserGroup;


@interface ListingView : UIViewController<NSFetchedResultsControllerDelegate>
{
    pushCalendarAppDelegate *appDelegate;
    //DetailViewController *eventViewController;
    Event *event;
    NSMutableArray *idArray;
    
    
    IBOutlet UITableView *tableView;
    IBOutlet DetailedView *detailedview;
    IBOutlet AddLocation *addlocation;
    IBOutlet UserView *userview;
    IBOutlet JourneyPlanner *journeyplanner;
    IBOutlet XMLParserGroup *xmlParserGroup;
    
}

-(void)saveObject:(NSDictionary *)dict;
-(void)insertNewObject:(NSDictionary *)MyEvent;

-(IBAction)back;
-(IBAction)detailedview;
-(IBAction)userview;
-(IBAction)journeyplanner;
-(IBAction)addlocation;
//-(IBAction)AddGroup;


@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSMutableArray *idArray;
@property (nonatomic, strong) UITableView *tableView;

@end
