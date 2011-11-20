//
//  CategoryViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 20/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryViewController.h"
#import "AroundMeResultsViewController.h"
#import "JSON.h"
@implementation CategoryViewController
@synthesize categoryViewtableView;
@synthesize categoryArray;
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
    
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    
    categoryArray = [[NSMutableArray alloc] init]; 
	[categoryArray addObject:@"Restaurants"];
    [categoryArray addObject:@"Bars and Clubs"];
    [categoryArray addObject:@"Accommodation"];
    [categoryArray addObject:@"Entertainment"];
    [categoryArray addObject:@"Things to do"];
    [categoryArray addObject:@"Luxury Products"];
    
}


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
} 

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[categoryViewtableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
	// Configure the cell.
	[cell.textLabel setText:[categoryArray objectAtIndex:indexPath.row]];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.responseData = [NSMutableData data];
    UITableViewCell *cell = (UITableViewCell *)[categoryViewtableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.title = cell.textLabel.text;
    
    //Get data from remote server
    NSString *url = [@"http://www.iconceptpress.com/iconceptlive/getdata.php?category=" stringByAppendingString:cell.textLabel.text];
    
    
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSLog(url);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];    
    
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	self.responseData = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [_connection release];
    responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil; //release the data
     //  NSLog(responseString);
    AroundMeResultsViewController *aroundmeResultsController = [[AroundMeResultsViewController alloc] init];
    aroundmeResultsController.title = self.title;
    
    aroundmeResultsController.responseString = self.responseString;
    
    aroundmeResultsController.navController = self.navigationController; //record navigation controller
    [self.navigationController pushViewController:aroundmeResultsController animated:YES];
    
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
