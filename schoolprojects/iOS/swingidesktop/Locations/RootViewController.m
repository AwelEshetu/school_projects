//
//  RootViewController.m
//  Locations
//
//  Created by iosdev on 10/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "LocationsAppDelegate.h"
#import "Event.h"


@implementation RootViewController


@synthesize eventsArray,managedObjectContext,addButton,locationManager;

-(void)addEvent{
    CLLocation *location=[locationManager location];
    if(!location){
        return;
    }
    // Create and configure a new instance of the Event entity.
    Event *event = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:managedObjectContext];
    
    CLLocationCoordinate2D coordinate = [location coordinate];
    [event setLatitude:[NSNumber numberWithDouble:coordinate.latitude]];
    [event setLongitude:[NSNumber numberWithDouble:coordinate.longitude]];
    [event setCreationDate:[NSDate date]];
    NSError *error = nil;
    if (![managedObjectContext save:&error]) {
        // Handle the error.
    }
    [eventsArray insertObject:event atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
//creating an accessor method to dynamically create the core location manager on demand:
-(CLLocationManager *)locactionManager {
    if (locationManager!= nil){
        return locationManager;
    }
    locationManager= [[CLLocationManager alloc] init ];
    locationManager.desiredAccuracy= kCLLocationAccuracyNearestTenMeters;
    locationManager.delegate= self;
    return locationManager;
}
//delegate methods to enable and disable the add button. if the core location manager is generating updates ,then enable the button,if it fails creating then disbale the button.
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    addButton.enabled=YES;
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    addButton.enabled=NO;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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
    [super viewDidLoad];
    // set the title
    self.title=@"Locations";
    
    //set up the buttons
    self.navigationItem.leftBarButtonItem=self.editButtonItem;
    
    addButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                           target:self action:@selector(addEvent)];
    addButton.enabled=NO;
    self.navigationItem.rightBarButtonItem=addButton;
    
    //start the location manager.
    [[self locationManager] startUpdatingLocation];
    //create a fetch request and set the entity.
    NSFetchRequest *request =[[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    //set the sort descriptor
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"creationDate" ascending:NO];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [request setSortDescriptors:sortDescriptors];
    [sortDescriptors release];
    [sortDescriptor release];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults =[[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        //handle the error.
    }
    //release objects that were allocated
    [self setEventsArray:mutableFetchResults];
    [mutableFetchResults release];
    [request release];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//memory management (vanshing ownership of anything created in ViewDidLoad that can be recrated)

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.eventsArray=nil;
    self.addButton=nil;
    self.locationManager=nil;
}
//another memory managment
-(void)dealloc{
    [managedObjectContext release];
    [eventsArray release];
    [locationManager release];
    [addButton release];
    [super dealloc];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     // a date formatter for the time stamp.
    static NSDateFormatter *dateFormatter=nil;
    if(dateFormatter==nil){
        dateFormatter=[[NSDateFormatter alloc]init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
    // a number formatter for the latitude and longitude
    static NSNumberFormatter *numberFormatter=nil;
    if (numberFormatter==nil) {
        numberFormatter=[[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setMaximumFractionDigits:3];
    }
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Event *event = (Event *)[eventsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dateFormatter stringFromDate:[event creationDate]];
    
    NSString *string =[NSString stringWithFormat:@"%@,%@",
                       [numberFormatter stringFromNumber:[event Latitude]],
                        [numberFormatter stringFromNumber:[event Longitude]]];
    cell.detailTextLabel.text =string;
    
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the mannaged object at the given index path
     NSManagedObject *eventToDelete = [eventsArray objectAtIndex:indexPath.row];
     [managedObjectContext deleteObject:eventToDelete];
     //update the array and table view.
     [eventsArray removeObjectAtIndex:indexPath.row];
     [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
     //commit the change 
     NSError *error = nil;
     if (![managedObjectContext save:&error]) {
         //handle error.
     }
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
