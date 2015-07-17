//
//  User.h
//  pushCalendar
//
//  Created by iosdev on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, Group;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *usersToGroups;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addEventsObject:(Event *)value;
- (void)removeEventsObject:(Event *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addUsersToGroupsObject:(Group *)value;
- (void)removeUsersToGroupsObject:(Group *)value;
- (void)addUsersToGroups:(NSSet *)values;
- (void)removeUsersToGroups:(NSSet *)values;

@end
