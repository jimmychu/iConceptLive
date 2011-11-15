//
//  MoreViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 15/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MoreViewController.h"

@implementation MoreViewController
@synthesize myTabBar2;

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if(item.tag == 0){
        
        aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];;
        
        [self.view insertSubview:shareVC.view belowSubview:myTabBar2];
       
        
    }
    
    if(item.tag == 1){
        
        self.title = @"Share to Friends";
        shareVC = [[ShareViewController alloc] initWithNibName:@"ShareViewController" bundle:nil];;
        
        [self.view insertSubview:shareVC.view belowSubview:myTabBar2];
    
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
    // Do any additional setup after loading the view from its nib.
    aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];;
    
    [self.view insertSubview:shareVC.view belowSubview:myTabBar2];

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
