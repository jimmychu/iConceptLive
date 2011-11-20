//
//  CommentsViewController.m
//  BNL
//
//  Created by Jia Zhu on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommentsViewController.h"
#import "JSON.h"
#import "CommentsTableCell.h"
#import "CommentsDetailViewController.h"

@implementation CommentsViewController
@synthesize responseString;
@synthesize resultsArray;
@synthesize commentstableView;
@synthesize total;
@synthesize nameArray;
@synthesize datetimeArray;
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
    // Do any additional setup after loading the view from its nib.
    
    NSArray* resultsData = [responseString JSONValue];
    
    
	[responseString release];
    
    total = [resultsData count];
    resultsArray = [[NSMutableArray alloc] init]; 
    nameArray = [[NSMutableArray alloc] init];
    datetimeArray = [[NSMutableArray alloc] init];
	for (int i = 0; i < total; i++){
        
        NSDictionary* singleResult = [resultsData objectAtIndex:i];
        
        
        NSString* message = [singleResult objectForKey:@"MESSAGEDETAILS"];
        NSString* publisheddatatime = [singleResult objectForKey:@"CREATEDDATETIME"];
        NSString* name = [singleResult objectForKey:@"COMMENTBY"];
        
        [resultsArray addObject:message];
        [nameArray addObject:name];
        [datetimeArray addObject:publisheddatatime];
        
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
    return total ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    
    static NSString *CellIdentifier = @"CommentsTableCell";
    
    
    CommentsTableCell *cell = (CommentsTableCell *) [commentstableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CommentsTableCell" owner:nil options:nil];
        
        for (id currentObject in topLevelObjects){
            if([currentObject isKindOfClass:[UITableViewCell class]]){
                cell = (CommentsTableCell *) currentObject;
                break;
            }
        }
        
    }
    
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell.
    cell.message.text = [resultsArray objectAtIndex:indexPath.row];
   
    cell.name.text = [nameArray objectAtIndex:indexPath.row];
     cell.name.text = [cell.name.text stringByAppendingString:@" said: "];
    cell.publishedtime.text = [datetimeArray objectAtIndex:indexPath.row];
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentsTableCell *cell = (CommentsTableCell *)[commentstableView cellForRowAtIndexPath:indexPath];
    CommentsDetailViewController *commentsDetail = [[CommentsDetailViewController alloc] init];
    
    commentsDetail.msg = cell.message.text;
    commentsDetail.nam = cell.name.text;
    commentsDetail.time = cell.publishedtime.text;
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.navController pushViewController:commentsDetail animated:YES];
    
    [commentsDetail release];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)dealloc
{
    
    
    [super dealloc];
    [resultsArray release];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
