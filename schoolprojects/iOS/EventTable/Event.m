//
//  Event.m
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Event.h"

@implementation Event

@synthesize eventID;
@synthesize Event_id;
@synthesize title;
@synthesize venu_id;
@synthesize contact_id;
@synthesize description;
@synthesize category_id;
@synthesize user_id;
@synthesize group_id;
@synthesize status_id;
@synthesize stamp;
@synthesize date;
@synthesize end_date;
@synthesize latitude;
@synthesize longitude;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void) dealloc {
    [title release];
    [description release];
    [stamp release];
    [end_date release];
    [date release];
    [super dealloc];
}

@end
