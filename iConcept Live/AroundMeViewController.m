//
//  AroundMeViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 17/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AroundMeViewController.h"
#import "AroundMeResultsViewController.h"

@implementation AroundMeViewController
@synthesize tableView;
@synthesize categoryArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        
        //php file url to call
        
        // NSLog(self.responseString);
        
        
        
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
    
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
        
    categoryArray = [[NSMutableArray alloc] init]; 
	[categoryArray addObject:@"Restaurants"];
    [categoryArray addObject:@"Pubs"];
    [categoryArray addObject:@"Convenient Shops"];
    [categoryArray addObject:@"Health and Beauty"];
    [categoryArray addObject:@"Petrol Stations"];
    [categoryArray addObject:@"Entertainment"];
    [categoryArray addObject:@"Hotels"];
    [categoryArray addObject:@"Fruit Shops"];
    [categoryArray addObject:@"Supermarkets"];
    [categoryArray addObject:@"After Hours"];
    
    
    
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
} 

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	[cell.textLabel setText:[categoryArray objectAtIndex:indexPath.row]];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AroundMeResultsViewController *aroundmeResultsController = [[AroundMeResultsViewController alloc] init];
    
    
    aroundmeResultsController.title = @"Results";
    //secondViewController.responseString = self.responseString;
    
    [self.navigationController pushViewController:aroundmeResultsController animated:YES];
    // [self presentModalViewController:detailViewController animated:YES];
    
    [aroundmeResultsController release];
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
