//
//  Event.h
//  MetroCalendar
//
//  Created by iosdev on 11/28/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Group, User;

@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * endTime;
@property (nonatomic, retain) NSString * eventDescription;
@property (nonatomic, retain) NSNumber * eventID;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * startTime;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) User *creator;
@property (nonatomic, retain) Group *eventToGroup;

@end
