//
//  DetailsViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "Details.h"
#import "DetailsMap.h"

@implementation DetailsViewController

@synthesize myTabBar1;
@synthesize currentViewController;
@synthesize RETAILERID;
@synthesize responseString;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag == 0){
        NSLog(@"didSelectItem: %d", item.tag);
        
        Details *detailsViewController = [[Details alloc] initWithNibName:@"Details" bundle:nil];
        
        
        detailsViewController.RETAILERID = self.responseString;
        
        [self.view insertSubview:detailsViewController.view belowSubview:myTabBar1];
     
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = detailsViewController;
        }
    }

    if(item.tag == 1){
        NSLog(@"didSelectItem: %d", item.tag);
        
        DetailsMap *detailmap = [[DetailsMap alloc] initWithNibName:@"DetailsMap" bundle:nil];;
        
        detailmap.RETAILERID = self.responseString;
        [self.view insertSubview:detailmap.view belowSubview:myTabBar1];
        
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = detailmap;
        }
    }
    
    
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
    NSLog(@"I AM IN detail VIEW NOW !");
    Details *detailsViewController = [[Details alloc] initWithNibName:@"Details" bundle:nil];
    
    
    detailsViewController.RETAILERID = self.responseString;

    [self.view insertSubview:detailsViewController.view belowSubview:myTabBar1];
    
    
    
    
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
