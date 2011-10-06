//
//  Details.m
//  BNL
//
//  Created by Jia Zhu on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Details.h"

@implementation Details
@synthesize RETAILERID;
@synthesize RETAILERINFO;
@synthesize RETAILERADDRESS;
@synthesize HOMEPAGE;
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
    
    [self.RETAILERINFO setText:name];
    [self.RETAILERADDRESS setText:addressDetail];
    [self.HOMEPAGE setText:HOMEPAGEURL];
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
