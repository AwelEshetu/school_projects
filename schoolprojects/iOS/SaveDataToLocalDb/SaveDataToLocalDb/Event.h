//
//  Event.h
//  SaveDataToLocalDb
//
//  Created by iosdev on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * Date;
@property (nonatomic, retain) NSString * Title;
@property (nonatomic, retain) NSString * Description;
@property (nonatomic, retain) NSString * StartTime;
@property (nonatomic, retain) NSString * EndTime;
@property (nonatomic, retain) NSString * UserID;

@end
