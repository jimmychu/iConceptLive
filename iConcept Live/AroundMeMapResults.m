//
//  AroundMeMapResults.m
//  iConceptLive
//
//  Created by Jia Zhu on 11/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AroundMeMapResults.h"
#import "JSON.h"

@implementation AroundMeMapResults

@synthesize mapView;
@synthesize responseData;
@synthesize responseString;

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
	
	NSArray* maplocations = [responseString JSONValue];
	[responseString release];
	
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.02;
    span.longitudeDelta=0.02;
    
    
    CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    region.span=span;
    region.center=location;
    address = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [maplocations count]; i++){
        
        if(addAnnotation != nil)
        {
            [mapView removeAnnotation:addAnnotation];
            [addAnnotation release];
            addAnnotation = nil;
        }
        //choose a random loan
        NSDictionary* maplocation = [maplocations objectAtIndex:i];
        
        //fetch the data
        NSNumber* longitude = [maplocation objectForKey:@"LONGITUDE_DEGREE"];
        NSNumber* latitude = [maplocation objectForKey:@"LATITUDE_DEGREE"];
        
        NSString* name = [maplocation objectForKey:@"NAME"];
        NSString* addressDetail = [maplocation objectForKey:@"ADDRESS"];
        
        location.longitude = longitude.floatValue;
        location.latitude = latitude.floatValue;
        
        
        addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:location];
        [addAnnotation setTitle:name];
        [addAnnotation setSubTitle:addressDetail];
        region.center=location;
        [address addObject:addAnnotation];
    }
    
    
    
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



@implementation AddressAnnotation

@synthesize coordinate;

-(void) setTitle:(NSString *)titleValue{
    
    [titleValue retain];
    [title release];
    
    title = titleValue;
}

- (void) setSubTitle:(NSString *)subtitleValue{
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

- (id)initWithCoordinate:(CLLocationCoordinate2D) c
{
    coordinate = c;
    NSLog(@"%f,%f", c.latitude, c.longitude);
    return self;
}

@end


