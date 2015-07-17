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
@property (nonatomic, strong) NSString * Date;
@property (nonatomic, strong) NSString * Title;
@property (nonatomic, strong) NSString * Description;
@property (nonatomic, strong) NSString * StartTime;
@property (nonatomic, strong) NSString * EndTime;
@property (nonatomic, strong) NSString * UserID;

@end
