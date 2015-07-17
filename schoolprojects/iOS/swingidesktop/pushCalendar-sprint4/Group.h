//
//  Group.h
//  pushCalendar
//
//  Created by iosdev on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSString * groupName;
@property (nonatomic, retain) NSNumber * groupID;
@property (nonatomic, retain) NSSet *groupsToUser;
@property (nonatomic, retain) NSSet *groupToEvents;
@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addGroupsToUserObject:(NSManagedObject *)value;
- (void)removeGroupsToUserObject:(NSManagedObject *)value;
- (void)addGroupsToUser:(NSSet *)values;
- (void)removeGroupsToUser:(NSSet *)values;

- (void)addGroupToEventsObject:(Event *)value;
- (void)removeGroupToEventsObject:(Event *)value;
- (void)addGroupToEvents:(NSSet *)values;
- (void)removeGroupToEvents:(NSSet *)values;

@end
