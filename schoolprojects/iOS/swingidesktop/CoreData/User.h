//
//  User.h
//  MetroCalendar
//
//  Created by iosdev on 11/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, Group;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *userToGroups;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addEventsObject:(Event *)value;
- (void)removeEventsObject:(Event *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;
- (void)addUserToGroupsObject:(Group *)value;
- (void)removeUserToGroupsObject:(Group *)value;
- (void)addUserToGroups:(NSSet *)values;
- (void)removeUserToGroups:(NSSet *)values;
@end
