//
//  Group.h
//  pushCalendar
//
//  Created by iosdev on 11/18/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Event;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSNumber * groupID;
@property (nonatomic, retain) NSString * groupname;
@property (nonatomic, retain) NSSet *users;
@property (nonatomic, retain) Event *grouptoevent;
@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addUsersObject:(NSManagedObject *)value;
- (void)removeUsersObject:(NSManagedObject *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
