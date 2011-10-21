//
//  CommentsViewController.m
//  BNL
//
//  Created by Jia Zhu on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommentsViewController.h"
#import "JSON.h"


@implementation CommentsViewController
@synthesize responseString;
@synthesize total;
@synthesize resultsArray;
@synthesize tableView1;

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
    
    NSArray* resultsData = [responseString JSONValue];
    // self.title = @"Comments";
    
	[responseString release];
    
    total = [resultsData count];
    
    resultsArray = [[NSMutableArray alloc] init]; 
    
	for (int i = 0; i < total; i++){
        
        NSDictionary* singleResult = [resultsData objectAtIndex:i];
        
        
        NSString* message = [singleResult objectForKey:@"MESSAGEDETAILS"];
        
        
        [resultsArray addObject:message];
        
         NSLog(message);
    }
    
    
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return total;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
        
    
    // Configure the cell
	cell.textLabel.text = [resultsArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)dealloc
{
    
    [resultsArray release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
