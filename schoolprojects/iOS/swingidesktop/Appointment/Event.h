//
//  Event.h
//  Appointment
//
//  Created by Dinesh Sapkota on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Event :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * timeStamp;
@property (nonatomic, retain) NSString * TOPIC;
@property (nonatomic, retain) NSString * STARTTIME;
@property (nonatomic, retain) NSString * ENDTIME;
@property (nonatomic, retain) NSString * WHERE;
@property (nonatomic, retain) NSString * LAST_NAME;
@property (nonatomic, retain) NSString * FIRST_NAME;
@property (nonatomic, retain) NSString * PROFESSION;
@property (nonatomic, retain) NSString * EMAIL;
@property (nonatomic, retain) NSString * ALERT;
@property (nonatomic, retain) NSString * DISTANCE;
@property (nonatomic, retain) NSString * PHONE;
@property (nonatomic, retain) NSString * END_DATE;
@property (nonatomic, retain) NSString * START_DATE;
@property (nonatomic, retain) NSString * ENDDATE;
@property (nonatomic, retain) NSString * STARTDATE;


@end



