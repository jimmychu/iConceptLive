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

@implementation AroundMeResults
@synthesize categoryName;
@synthesize categoryNameValue;
@synthesize responseString;
@synthesize resultsArray;
@synthesize tableView;
@synthesize total;

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
    
      NSLog(self.responseString);
    
    NSArray* resultsData = [responseString JSONValue];
    
	[responseString release];
    
    total = [resultsData count];
    
    resultsArray = [[NSMutableArray alloc] init]; 

	for (int i = 0; i < total; i++){
        //choose a random loan
        NSDictionary* singleResult = [resultsData objectAtIndex:i];
        
        
        NSString* name = [singleResult objectForKey:@"NAME"];
        NSString* addressDetail = [singleResult objectForKey:@"ADDRESS"];
        
        [resultsArray addObject:name];
 
    }
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"CustomTableCell";
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
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
    
    return cell;
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
