//
//  DetailMapViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 13/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailMapViewController.h"
#import "JSON.h"

/*@implementation CLLocationManager (TemporaryHack)

- (void)hackLocationFix
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:42 longitude:-50];
    [[self delegate] locationManager:self didUpdateToLocation:location fromLocation:nil];     
}

- (void)startUpdatingLocation
{
    [self performSelector:@selector(hackLocationFix) withObject:nil afterDelay:0.1];
}

@end*/

@implementation DetailMapViewController
@synthesize webview;
@synthesize RETAILERID;
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
    lm = [[CLLocationManager alloc] init];
  
        lm.delegate = self;
        lm.desiredAccuracy = kCLLocationAccuracyBest;
        lm.distanceFilter = 1000.0f;
        [lm startUpdatingLocation];
    
        
    
}

- (void) locationManager: (CLLocationManager *) manager
     didUpdateToLocation: (CLLocation *) newLocation
            fromLocation: (CLLocation *) oldLocation{
    lat = [[NSString alloc] initWithFormat:@"%g", 
                     newLocation.coordinate.latitude];
   
    
    lng = [[NSString alloc] initWithFormat:@"%g", 
                     newLocation.coordinate.longitude];
    
    
    NSString *acc = [[NSString alloc] initWithFormat:@"%g", 
                     newLocation.horizontalAccuracy];
     
    // Do any additional setup after loading the view from its nib.
    NSArray* detailsData = [self.RETAILERID JSONValue];
    
    //choose a random loan
    NSDictionary* singleResult = [detailsData objectAtIndex:0];
    
    
    NSString* longitude = [singleResult objectForKey:@"LONGITUDE_DEGREE"];
    NSString* latitude = [singleResult objectForKey:@"LATITUDE_DEGREE"];
    
    
    // NSString *mapurl = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=Current%20Location&daddr=%f,%f", latitude, longitude];
    NSString *mapurl = @"http://maps.google.com/maps?saddr=";
    mapurl = [mapurl stringByAppendingString:lat];
    mapurl = [mapurl stringByAppendingString:@","];
    mapurl = [mapurl stringByAppendingString:lng];
    mapurl = [mapurl stringByAppendingString:@"&daddr="];
    mapurl = [mapurl stringByAppendingString:latitude];
    mapurl = [mapurl stringByAppendingString:@","];
    mapurl = [mapurl stringByAppendingString:longitude];
    mapurl = [mapurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    NSURL *url = [NSURL URLWithString:mapurl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];

    
    [acc release];
    [lat release];
    [lng release];
}
- (void) locationManager: (CLLocationManager *) manager
        didFailWithError: (NSError *) error {
    NSString *msg = [[NSString alloc] 
                     initWithString:@"Error obtaining location"];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Error" 
                          message:msg 
                          delegate:nil 
                          cancelButtonTitle: @"Done"
                          otherButtonTitles:nil];
    [alert show];    
    [msg release];
    [alert release];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
							 error.localizedDescription];
	[webview loadHTMLString:errorString baseURL:nil];
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

- (void) dealloc{
    [lm release];
   
    [super dealloc];
}
@end
