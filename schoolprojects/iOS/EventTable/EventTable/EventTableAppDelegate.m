//
//  EventTableAppDelegate.m
//  EventTable
//
//  Created by iosdev on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventTableAppDelegate.h"
#import "RootViewController.h"
#import "XMLParser.h"

@implementation EventTableAppDelegate

@synthesize events;

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    NSURL *url = [[NSURL alloc] initWithString:@"http://ec2-204-236-207-173.compute-1.amazonaws.com/test/pull_trigger_update.php"];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    
    //Initialize the delegate.
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    
    //Set delegate
    [xmlParser setDelegate:parser];
    
    
    //Start parsing the XML file.
    BOOL success = [xmlParser parse];
    
    if(success)
        NSLog(@"No Errors");
    else
        NSLog(@"Error Error Error!!!");
    
    self.window.rootViewController = self.navigationController;
    //[window addSubview:[navigationController view] ];
    [self.window makeKeyAndVisible];
    //s[window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

@end
