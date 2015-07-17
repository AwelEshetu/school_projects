//
//  Event.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject{
    NSInteger eventID;
    NSInteger Event_id;
    NSString *title; //Same name as the Entity Name.
    NSInteger venue_id;
    NSInteger contact_id;
    NSString *description; //Same name as the Entity Name.
    NSInteger category_id;
    NSInteger user_id;
    NSInteger group_id;
    NSInteger status_id;
    NSString *stamp; //Same name as the Entity Name.
    NSString *date;//Same date as the Entity Name
    NSString *end_date;
    NSInteger latitude;
    NSInteger longitude;
}
@property (nonatomic, readwrite) NSInteger eventID;
@property (nonatomic, readwrite) NSInteger Event_id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, readwrite) NSInteger venu_id;
@property (nonatomic, readwrite) NSInteger contact_id;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, readwrite) NSInteger category_id;
@property (nonatomic, readwrite) NSInteger user_id;
@property (nonatomic, readwrite) NSInteger group_id;
@property (nonatomic, readwrite) NSInteger status_id;
@property (nonatomic, retain) NSString *stamp;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *end_date;

@property (nonatomic, readwrite) NSInteger latitude;
@property (nonatomic, readwrite) NSInteger longitude;



@end
