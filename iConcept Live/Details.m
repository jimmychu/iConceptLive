//
//  Details.m
//  BNL
//
//  Created by Jia Zhu on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Details.h"
#import "JSON.h"
#import <QuartzCore/QuartzCore.h>

@implementation Details
@synthesize RETAILERID;
@synthesize mapView;
@synthesize textView;
@synthesize scrollView;

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
    
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    textView.backgroundColor = UIColor.blackColor;
    
    NSArray* detailsData = [self.RETAILERID JSONValue];
 
    //choose a random loan
    NSDictionary* singleResult = [detailsData objectAtIndex:0];
    
    
    NSString* name = [singleResult objectForKey:@"NAME"];
   
    NSString* addressDetail = [singleResult objectForKey:@"ADDRESS"];
    NSString* SUBURB = [singleResult objectForKey:@"SUBURB"];   
    NSString* STATE = [singleResult objectForKey:@"STATE"]; 
    NSString* POSTCODE = [singleResult objectForKey:@"POSTCODE"]; 
    NSString* HOMEPAGEURL = [singleResult objectForKey:@"HOMEPAGE"];
    
    
    addressDetail = [addressDetail stringByAppendingString:@", "];
    addressDetail = [addressDetail stringByAppendingString:SUBURB];
    addressDetail = [addressDetail stringByAppendingString:@", "];
    addressDetail = [addressDetail stringByAppendingString:STATE];
    addressDetail = [addressDetail stringByAppendingString:@", "];
    addressDetail = [addressDetail stringByAppendingString:POSTCODE];
    
    NSString* total = @"";
    total = [total stringByAppendingString:name];
    total = [total stringByAppendingString:@"\n\n"];
    total = [total stringByAppendingString:addressDetail];
    total = [total stringByAppendingString:@"\n\n"];
    total = [total stringByAppendingString:HOMEPAGEURL];
    
    [self.textView setText:total];

    
    // Do any additional setup after loading the view from its nib.
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.01;
    span.longitudeDelta=0.01;
    
    
    CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    region.span=span;
    
    NSMutableArray *address = [[NSMutableArray alloc] init];
    
    if(addAnnotation != nil)
    {
        [mapView removeAnnotation:addAnnotation];
        [addAnnotation release];
        addAnnotation = nil;
    }
    
    
    
    NSNumber* longitude = [singleResult objectForKey:@"LONGITUDE_DEGREE"];
    NSNumber* latitude = [singleResult objectForKey:@"LATITUDE_DEGREE"];
    
    
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
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(847, 800);
    [scrollView addSubview:mapView];
    [mapView release];
    [scrollView addSubview:textView];
    [textView release];
    
    [self.view addSubview:scrollView];
    [scrollView release];
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
