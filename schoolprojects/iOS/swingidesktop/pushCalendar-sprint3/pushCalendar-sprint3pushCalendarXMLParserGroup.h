//
//  XMLParserGroup.h
//  EventClientDB
//
//  Created by iosdev on 11/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@class ListingView,pushCalendarAppDelegate;

@interface XMLParserGroup : UIViewController<NSXMLParserDelegate>{
    ListingView *RVC;
    NSMutableString *currentElementValue;
    NSEntityDescription *entity;
    pushCalendarAppDelegate *appDelegate;
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

@property (nonatomic, strong)NSError *error;
@property (nonatomic, strong)Event *aEvent;
@property (nonatomic, strong)NSNumber *ID;
@property (nonatomic, strong)NSEntityDescription *entity;
@property (nonatomic, strong)NSFetchRequest *request;
@property (nonatomic,strong)NSPredicate *predicate;
@property(nonatomic,strong)ListingView *RVC;
@property (nonatomic, strong)IBOutlet UILabel *label;
@property (nonatomic, strong)NSMutableData *receivedData;
@property (nonatomic, strong)NSMutableArray *arrayID;

@end
