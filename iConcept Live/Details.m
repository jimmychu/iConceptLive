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
@synthesize nameView;
@synthesize textView;
@synthesize homepageView;
@synthesize scrollView;
@synthesize contactView;
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
    
    nameView.layer.cornerRadius = 5;
    nameView.clipsToBounds = YES;
    
    homepageView.layer.cornerRadius = 5;
    homepageView.clipsToBounds = YES;
    
    contactView.layer.cornerRadius = 5;
    contactView.clipsToBounds = YES;
    //textView.backgroundColor = UIColor.blackColor;
    
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
    total = [total stringByAppendingString:@"\n"];
    total = [total stringByAppendingString:addressDetail];
   // total = [total stringByAppendingString:@"\n\n"];
    //total = [total stringByAppendingString:HOMEPAGEURL];
    
    [self.textView setText:total];
    [self.nameView setText:total];
    [self.homepageView setText:HOMEPAGEURL];
    
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(847, 800);
  
    [scrollView addSubview:textView];
    [textView release];
    
    [scrollView addSubview:nameView];
    [nameView release];
    
    [scrollView addSubview:homepageView];
    [homepageView release];
    
    [scrollView addSubview:contactView];
    [contactView release];
    
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

