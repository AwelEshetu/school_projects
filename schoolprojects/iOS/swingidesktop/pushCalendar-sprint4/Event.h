//
//  Event.h
//  pushCalendar
//
//  Created by iosdev on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSNumber * eventID;
@property (nonatomic, retain) NSString * eventDesctiption;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSManagedObject *creator;
@property (nonatomic, retain) NSManagedObject *eventToGroup;

@end
