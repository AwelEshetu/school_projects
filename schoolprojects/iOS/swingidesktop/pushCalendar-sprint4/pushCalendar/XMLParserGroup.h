//
//  XMLParserGroup.h
//  EventClientDB
//
//  Created by iosdev on 11/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class RootViewController,pushCalendarAppDelegate,Event;

@interface XMLParserGroup : UIViewController<NSXMLParserDelegate>{
    RootViewController *RVC;
    NSMutableString *currentElementValue;
    NSEntityDescription *entity;
    pushCalendarAppDelegate *appDelegate;
    RootViewController *rvc;
    NSError *error;
    Event *aEvent;
    NSNumber *ID;
    BOOL boolen;
    NSFetchRequest *request;
    NSPredicate *predicate;
    IBOutlet UILabel *label;
    NSMutableData *receivedData;
    NSMutableArray *arrayID;
    BOOL myboolen;
}
- (void)parseData:(NSData *)data;
- (void)getID:(NSMutableArray *)Array;
-(IBAction)back;

@property (nonatomic, retain)NSError *error;
@property (nonatomic, retain)Event *aEvent;
@property (nonatomic, retain)NSNumber *ID;
@property (nonatomic, retain)NSEntityDescription *entity;
@property (nonatomic, retain)NSFetchRequest *request;
@property (nonatomic,retain)NSPredicate *predicate;
@property(nonatomic,retain)RootViewController *RVC;
@property (nonatomic, retain)IBOutlet UILabel *label;
@property (nonatomic, retain)NSMutableData *receivedData;
@property (nonatomic, retain)NSMutableArray *arrayID;

@end
