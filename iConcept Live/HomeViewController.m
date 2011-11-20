//
//  HomeViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 16/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "AroundMeViewController.h"
#import "MoreViewController.h"
#import "CategoryViewController.h"
#import "AroundMeResultsViewController.h"
#import "JSON.h"
@implementation HomeViewController
@synthesize responseString;
@synthesize responseData;

- (IBAction)pushViewController:(id)sender{
    
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
       
    //Get data from remote server
    NSString *url = @"http://www.iconceptpress.com/iconceptlive/getdata.php?lat=";
    
    url = [url stringByAppendingString:lat];
    url = [url stringByAppendingString:@"&long="];
    url = [url stringByAppendingString:lng];
   
    

    self.responseData = [NSMutableData data];
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];  
   
    [lm stopUpdatingLocation];
    
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




- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	responseData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [_connection release];
    responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil; //release the data

    AroundMeResultsViewController *aroundmeResultsController = [[AroundMeResultsViewController alloc] init];
    aroundmeResultsController.title = @"Around Me";
    
    aroundmeResultsController.responseString = responseString;
    
    aroundmeResultsController.navController = self.navigationController; //record navigation controller
    [self.navigationController pushViewController:aroundmeResultsController animated:YES];
    
    [aroundmeResultsController release];
    
}



- (IBAction)pushCategoryViewController:(id)sender{
    //send to next view
    CategoryViewController *categoryViewController = [[CategoryViewController alloc] init];
    categoryViewController.title = @"Category";
    [self.navigationController pushViewController:categoryViewController animated:YES];
    [categoryViewController release];
    
}


- (IBAction)pushMoreViewController:(id)sender{
    //send to next view
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    moreVC.title = @"About";
    [self.navigationController pushViewController:moreVC animated:YES];
    [moreVC release];
    
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
