//
//  pushCalendarViewController.h
//  pushCalendar
//
//  Created by iosdev on 10/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AddEvent;
@class AddLocation;
@class DetailedView;
@class UserView;
@class JourneyPlanner;
@class ListingView;
@class Testview;

 

@interface pushCalendarViewController : UIViewController
{
    IBOutlet AddEvent *addevent;
    IBOutlet AddLocation *addlocation;
    IBOutlet DetailedView *detailedview;
    IBOutlet UserView *userview;
    IBOutlet JourneyPlanner *journeyplanner;
    IBOutlet ListingView *listingview;
    IBOutlet pushCalendarViewController *homeview;
    IBOutlet Testview *testview;

 
    

}

-(IBAction)addevent;
-(IBAction)detailedview;
-(IBAction)userview;
-(IBAction)journeyplanner;
-(IBAction)addlocation;
-(IBAction)listingview;


@end
