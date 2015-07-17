//
//  XMLParserGroup.m
//  EventClientDB
//
//  Created by iosdev on 11/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XMLParserGroup.h"
#import "pushCalendarAppDelegate.h"
#import "Event.h"

@implementation XMLParserGroup

@synthesize RVC;
@synthesize error;
@synthesize aEvent;
@synthesize ID;
@synthesize entity;
@synthesize request,predicate;
@synthesize label;
@synthesize receivedData;
@synthesize arrayID;

- (void)getID:(NSMutableArray *)Array{
    arrayID=Array;
    NSLog(@"My array in parser%@",Array);
}

-(IBAction)back
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    appDelegate = (pushCalendarAppDelegate *)[[UIApplication sharedApplication] delegate];
    return self;
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad

{
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://ec2-204-236-207-173.compute-1.amazonaws.com/test/pull_data1.php"]cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        receivedData = [NSMutableData data];
    } else {
        NSLog(@"nothing received");
    }
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
// NSURLConnection will cal this method when it did receive resonse
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
}
// NSURLConnection will cal this method when it didReceiveData
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[receivedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	[self parseData:receivedData];
}
- (void)parseData:(NSData *)data {
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
	[parser setDelegate:self]; // The parser calls methods in this class
	[parser setShouldProcessNamespaces:NO]; // We don't care about namespaces
	[parser setShouldReportNamespacePrefixes:NO]; //
	[parser setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	[parser parse]; // Parse that data..
	
}

//XMLParser.m
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    
    if([elementName isEqualToString:@"calendar"]) {
        NSLog(@"delegate array%@",appDelegate.arrayID);
        //Initialize the array.
        //appDelegate.events = [[NSMutableArray alloc] init];
        error = nil;
        
    }
    else if([elementName isEqualToString:@"event"]) {
        
        //Extract the attribute here.
        //aEvent.eventID=[[attributeDict objectForKey:@"event_id"] integerValue]];
        ID = [NSNumber numberWithInt:[[attributeDict objectForKey:@"event_id"] integerValue]];
        //[aEvent setValue:ID forKey:@"eventID"];
        myboolen = FALSE;
        
        for (int i=0; i<[arrayID count]; i++) {
            NSNumber *check=[arrayID objectAtIndex:i];
            NSLog(@"%@",check);
            if ([check intValue]==[ID intValue]) {
                myboolen = TRUE;
                //NSLog(@"%@",myboolen);
            }
        }
        if (myboolen==FALSE) {
            aEvent = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:[appDelegate managedObjectContext]];
            aEvent.eventID=ID;
        }
        
        
        
        //[aEvent setValue:ID forKey:@"eventID"];
        
        //aEvent.eventID = ID;
        //aEvent.eventID = [NSNumber numberWithInt:[[attributeDict objectForKey:@"event_id"] integerValue]];
        
        //ESVC.myEventId = ID;
        //NSLog(@"Reading id value :%@", ID);
        
    }
    
    //NSLog(@"Processing Element: %@", elementName);
}

//XMLParser.m
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if(!currentElementValue)
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    else{
        [currentElementValue appendString:string];
        
        //NSLog(@"Processing Value: %@", currentElementValue);
    }
    
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if([elementName isEqualToString:@"calendar"]) {
        // consider saving the context here?
        
        [appDelegate saveContext];
        return;
    }
    
    //There is nothing to do if we encounter the Event element here.
    //If we encounter the Event element howevere, we want to add the event object to the array
    // and release the object.
    if([elementName isEqualToString:@"event"]) {
        //[appDelegate.events addObject:aEvent];
        
        //NSLog(@"My events: %@",appDelegate.events);
        //[appDelegate saveContext];
        //[aEvent release];
        //aEvent = nil;
    }
    else if (myboolen==FALSE){
        
        //aEvent = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext://[appDelegate managedObjectContext]];
        if ([elementName isEqualToString:@"title"]) {
            [aEvent setValue:currentElementValue forKey:@"title"];
        }
        else if ([elementName isEqualToString:@"description"]) {
            [aEvent setValue:currentElementValue forKey:@"eventDescription"];
        }
        else if ([elementName isEqualToString:@"date"]) {
            [aEvent setValue:currentElementValue forKey:@"date"];
        }
        
        else if ([elementName isEqualToString:@"location"]) {
            [aEvent setValue:currentElementValue forKey:@"location"];
        }
        
        
        //[aEvent setValue:currentElementValue forKey:elementName];
        
        
        currentElementValue = nil;
        
        
        
    }
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
