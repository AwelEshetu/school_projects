//
//  RootViewController.h
//  Locations
//
//  Created by iosdev on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
/*root view controller serves as the core location manager's delegate that is why it adopts the CLLocationMangaerDelegate protocol*/

#import <CoreLocation/CoreLocation.h>

@interface RootViewController : UITableViewController <CLLocationManagerDelegate> {
    NSMutableArray *eventsArray; 
    NSManagedObjectContext *managedObjectContext;
    CLLocationManager *locationManager;
    UIBarButtonItem *addButton;
    
    // above are four properties for the events array,the managed object context, the core location manager and an add button.
    
}
-(void)addEvent;
@property (nonatomic,retain)NSMutableArray *eventsArray;
@property (nonatomic,retain)NSManagedObjectContext *managedObjectContext;
@property (nonatomic,retain)CLLocationManager *locationManager;
@property (nonatomic,retain)UIBarButtonItem *addButton;

@end
