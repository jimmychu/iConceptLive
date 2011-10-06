//
//  DetailsMapViewController.m
//  BNL
//
//  Created by Jia Zhu on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsMap.h"

#import "JSON.h"

@implementation DetailsMap
@synthesize mapView;
@synthesize RETAILERID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
    
    //NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	//self.responseData = nil;
	
	NSArray* maplocations = [self.RETAILERID JSONValue];
	
	
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.02;
    span.longitudeDelta=0.02;
    
    
    CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    region.span=span;
    
    NSMutableArray *address = [[NSMutableArray alloc] init];
    
    if(addAnnotation != nil)
    {
        [mapView removeAnnotation:addAnnotation];
        [addAnnotation release];
        addAnnotation = nil;
    }
    
    NSDictionary* singleResult = [maplocations objectAtIndex:0];
    
    NSNumber* longitude = [singleResult objectForKey:@"LONGITUDE_DEGREE"];
    NSNumber* latitude = [singleResult objectForKey:@"LATITUDE_DEGREE"];
    
    NSString* name = [singleResult objectForKey:@"NAME"];
    NSString* addressDetail = [singleResult objectForKey:@"ADDRESS"];
    
    
    
    location.longitude = longitude.floatValue;
    location.latitude = latitude.floatValue;
    
    
    addAnnotation = [[DetailsAddressAnnotation alloc] initWithCoordinate:location];
    [addAnnotation setTitle:name];
    [addAnnotation setSubTitle:addressDetail];
    region.center=location;
    [address addObject:addAnnotation];
    
    [mapView addAnnotations:address];
    
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];
    
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

@implementation DetailsAddressAnnotation

@synthesize coordinate;

-  (void) setTitle:(NSString *)titleValue{
    
    [titleValue retain];
    [title release];
    
    title = titleValue;
}

-  (void) setSubTitle:(NSString *)subtitleValue{
    [subtitleValue retain];
    [subtitle release];
    subtitle = subtitleValue;
}

- (NSString *)subtitle
{   
    //please modify to retrieve subtitle from database
    return subtitle;
}
- (NSString *)title
{
    return title;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c
{
    coordinate = c;
    NSLog(@"%f,%f", c.latitude, c.longitude);
    return self;
}

@end




