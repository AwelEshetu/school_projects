//
//  mapAnnotation.m
//  pushCalendar
//
//  Created by iosdev on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "mapAnnotation.h"
@implementation mapAnnotation

@synthesize coordinate;

- (NSString *)subtitle{
	return @"Sub Title";
}
- (NSString *)title{
	return @"Title";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

@end
