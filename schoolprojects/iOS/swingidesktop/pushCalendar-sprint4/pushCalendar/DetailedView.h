//
//  DetailedView.h
//  pushCalendar
//
//  Created by iosdev on 11/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetAlarm.h"
#import "MapView.h"

@class SetAlarm;
@class MapView;

@interface DetailedView : UIViewController
{
    IBOutlet SetAlarm *setalarm;
    IBOutlet MapView *mapview;
    
    
}


-(IBAction) back;
-(IBAction)setalarm;
-(IBAction)mapview;

@end
