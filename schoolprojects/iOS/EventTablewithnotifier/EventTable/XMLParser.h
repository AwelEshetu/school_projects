//
//  XMLParser.h
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventViewController.h"

@class EventTableAppDelegate, Event;


@interface XMLParser : NSObject<NSXMLParserDelegate>{

    NSMutableString *currentElementValue;

    EventTableAppDelegate *appDelegate;
    Event *aEvent;
}
-(XMLParser *)initXMLParser;

@end
