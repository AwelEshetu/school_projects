//
//  Event.h
//  pushCalendar
//
//  Created by iosdev on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * eventDesctiption;
@property (nonatomic, retain) NSNumber * eventID;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSManagedObject *creater;
@property (nonatomic, retain) NSManagedObject *eventtogroup;

@end
