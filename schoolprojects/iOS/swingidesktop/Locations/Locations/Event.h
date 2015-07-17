//
//  Event.h
//  Locations
//
//  Created by iosdev on 10/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSNumber * Latitude;
@property (nonatomic, retain) NSNumber * Longitude;

@end
