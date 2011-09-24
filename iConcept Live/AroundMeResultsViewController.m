//
//  AroundMeResultsController.m
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AroundMeResultsViewController.h"
#import "AroundMeResults.h"
#import "AroundMeMapResults.h"


@implementation AroundMeResultsViewController
@synthesize myTabBar;
@synthesize currentViewController;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag == 0){
        NSLog(@"didSelectItem: %d", item.tag);
        AroundMeResults *resultsViewController = [[AroundMeResults alloc] initWithNibName:@"AroundMeResults" bundle:nil];
        
        [self.view insertSubview:resultsViewController.view belowSubview:myTabBar];
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = resultsViewController;
        }
    }
    
    if(item.tag == 1){
        NSLog(@"didSelectItem: %d", item.tag);
        
        AroundMeMapResults *mapViewController = [[AroundMeMapResults alloc] initWithNibName:@"AroundMeMapResults" bundle:nil];
        
        [self.view insertSubview:mapViewController.view belowSubview:myTabBar];
        
        if(currentViewController !=nil){
            [currentViewController.view removeFromSuperview];
            currentViewController = mapViewController;
        }
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"sdsdsddd");
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
    
    NSLog(@"I AM IN SECOND VIEW NOW !");
    
    
    if(myTabBar == nil){
        NSLog(@"sssss");
    }
    
    AroundMeResults *resultsViewController = [[AroundMeResults alloc] initWithNibName:@"AroundMeResults" bundle:nil];;
    //resultsViewController.responseString = self.responseString;
    // NSLog(self.responseString);
    //resultsViewController.navController =  self.navigationController;
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
