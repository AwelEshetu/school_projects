//
//  XMLParser.m
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLParser.h"
#import "EventTableAppDelegate.h"
#import "Event.h"

@implementation XMLParser

-(XMLParser *)initXMLParser{
    [super init];
    
    appDelegate = (EventTableAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    return self;
}

//XMLParser.m
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    if([elementName isEqualToString:@"calendar"]) {
        //Initialize the array.
        appDelegate.events = [[NSMutableArray alloc] init];
        
    }
    else if([elementName isEqualToString:@"event"]) {
        
        //Initialize the Event.
        aEvent = [[Event alloc] init];
        
        
        //Extract the attribute here.
        aEvent.eventID = [[attributeDict objectForKey:@"event_id"] integerValue];
        
        NSLog(@"Reading id value :%i", aEvent.eventID);
    }
    
    NSLog(@"Processing Element: %@", elementName);
}

//XMLParser.m
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(!currentElementValue)
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    else{
        [currentElementValue appendString:string];
    
    NSLog(@"Processing Value: %@", currentElementValue);
    }
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"calendar"])
        return;
    
    //There is nothing to do if we encounter the Books element here.
    //If we encounter the Book element howevere, we want to add the book object to the array
    // and release the object.
    if([elementName isEqualToString:@"event"]) {
        [appDelegate.events addObject:aEvent];
        
        NSLog(@"My events: %@",appDelegate.events);
        [aEvent release];
        aEvent = nil;
    }
    else{
    [aEvent setValue:currentElementValue forKey:elementName];
    
    [currentElementValue release];
    currentElementValue = nil;
    }
}
- (void) dealloc {
	
	[aEvent release];
	[currentElementValue release];
	[super dealloc];
}

@end
