//
//  UserView.m
//  pushCalendar
//
//  Created by iosdev on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserView.h"

@implementation UserView

@synthesize email;
@synthesize password;

-(IBAction)back
{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
}

-(IBAction)createAccount
{
    NSString *urlString = [NSString stringWithFormat:@"http://ec2-204-236-207-173.compute-1.amazonaws.com/test/save_user.php?email=%@&password=%d",email.text,password.text];
    
    
    NSLog(@"my token in urlstring: %@",urlString);
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //NSData *urlData;
    NSURLResponse *response;
    NSError *error;
    //urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    NSString *responseData= [[NSString alloc] initWithData:[NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error] encoding:NSUTF8StringEncoding]; 
    
    
    //NSLog(@"error is %@\n", error);
    //NSLog(@"url data: %@\n",urlData );
    NSLog(@"server response is %@\n", responseData);
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
