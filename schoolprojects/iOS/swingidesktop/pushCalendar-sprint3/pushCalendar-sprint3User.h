//
//  User.h
//  pushCalendar
//
//  Created by iosdev on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event, Group;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * userID;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * emailaddress;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSSet *events;
@property (nonatomic, retain) NSSet *groups;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addEventsObject:(Event *)value;
- (void)removeEventsObject:(Event *)value;
- (void)addEvents:(NSSet *)values;
- (void)removeEvents:(NSSet *)values;

- (void)addGroupsObject:(Group *)value;
- (void)removeGroupsObject:(Group *)value;
- (void)addGroups:(NSSet *)values;
- (void)removeGroups:(NSSet *)values;

@end
