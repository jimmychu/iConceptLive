//
//  AroundMeResults.m
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AroundMeResults.h"
#import "JSON.h"
#import "CustomTableCell.h"
#import "DetailsViewController.h"

@implementation AroundMeResults
@synthesize responseString;
@synthesize resultsArray;
@synthesize addressArray;
@synthesize retailerIDArray;
@synthesize tableView;
@synthesize total;
@synthesize responseData;
@synthesize navController;

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
    
    NSArray* resultsData = [responseString JSONValue];
    
	[responseString release];
    
    total = [resultsData count];
    
    resultsArray = [[NSMutableArray alloc] init]; 
    addressArray = [[NSMutableArray alloc] init];
    retailerIDArray = [[NSMutableArray alloc] init];

	for (int i = 0; i < total; i++){
        //choose a random loan
        NSDictionary* singleResult = [resultsData objectAtIndex:i];
        
        NSString* retailerID = [singleResult objectForKey:@"ID"];
        NSString* name = [singleResult objectForKey:@"NAME"];
        NSString* addressDetail = [singleResult objectForKey:@"ADDRESS"];
        NSString* suburb = [singleResult objectForKey:@"SUBURB"];
        NSString* state = [singleResult objectForKey:@"STATE"];
        [resultsArray addObject:name];
        addressDetail = [addressDetail stringByAppendingString:@", "];
        addressDetail = [addressDetail stringByAppendingString:suburb];
        addressDetail = [addressDetail stringByAppendingString:@", "];
        addressDetail = [addressDetail stringByAppendingString:state];
        [addressArray addObject:addressDetail];
        [retailerIDArray addObject:retailerID]; //store retailerid
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
    static NSString *CellIdentifier = @"CustomTableCell";
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
       
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:nil options:nil];
        
        for (id currentObject in topLevelObjects){
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (CustomTableCell *) currentObject;
                break;
            }
        }
        
    }
    // Configure the cell.
	cell.name.text = [resultsArray objectAtIndex:indexPath.row];
    cell.address.text = [addressArray objectAtIndex:indexPath.row];
    cell.retailerID.text = [retailerIDArray objectAtIndex:indexPath.row];
         return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.responseData = [NSMutableData data];
    
    CustomTableCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSString *url = [@"http://www.iconceptpress.com/iconceptlive/getdata.php?id=" stringByAppendingString:cell.retailerID.text];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
  
    
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
    [connection release];
    self.responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil;
    
    DetailsViewController *detailsController = [[DetailsViewController alloc] init];
    detailsController.title = @"Details";
    
    detailsController.responseString = self.responseString;
    
    
    [self.navController pushViewController:detailsController animated:YES]; //push to details view of this retailer
    
    [detailsController release];
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
