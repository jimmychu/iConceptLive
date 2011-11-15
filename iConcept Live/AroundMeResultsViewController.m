//
//  AroundMeResultsController.m
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AroundMeResultsViewController.h"

#import "AroundMeMapResults.h"


@implementation AroundMeResultsViewController
@synthesize myTabBar;
@synthesize currentViewController;
@synthesize responseString;
@synthesize navController;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag == 0){
     
      resultsViewController = [[AroundMeResults alloc] initWithNibName:@"AroundMeResults" bundle:nil];
        
        resultsViewController.responseString = self.responseString;
        resultsViewController.navController = self.navController;
        [self.view insertSubview:resultsViewController.view belowSubview:myTabBar];
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = resultsViewController;
        }
    }
    
    if(item.tag == 1){
       
        
        mapViewController = [[AroundMeMapResults alloc] initWithNibName:@"AroundMeMapResults" bundle:nil];
        mapViewController.responseString = self.responseString;
        [self.view insertSubview:mapViewController.view belowSubview:myTabBar];
        
        
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
    
    
    resultsViewController = [[AroundMeResults alloc] initWithNibName:@"AroundMeResults" bundle:nil];;
    resultsViewController.responseString = self.responseString;
    
   
    resultsViewController.navController = self.navController;
    [self.view insertSubview:resultsViewController.view belowSubview:myTabBar];
    
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
