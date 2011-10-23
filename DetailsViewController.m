//
//  DetailsViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import "Details.h"
#import "CommentsViewController.h"

#import "JSON.h"

@implementation DetailsViewController
@synthesize myCommentsVC;
@synthesize myTabBar1;
@synthesize currentViewController;
@synthesize RETAILERID;
@synthesize responseString;
@synthesize responseData;
@synthesize navController;
@synthesize commmentsData;

//details view tab controller for this retailer
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
    
    
    
    if(item.tag == 2){
        NSLog(@"didSelectItem: %d", item.tag);
        
        NSString *url = @"http://www.iconceptpress.com/iconceptlive/getcomments.php";
        
        self.responseData = [NSMutableData data];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
    }
    
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
    
    self.commmentsData = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    self.responseData = nil;
    
    // NSLog(self.responseString);
    CommentsViewController *comments = [[CommentsViewController alloc] initWithNibName:@"CommentsViewController" bundle:nil];;
    comments.responseString = self.commmentsData;
    
    [self.view insertSubview:comments.view belowSubview:myTabBar1];
    //[comments release];
        
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
    
    
    UIImage *image = [UIImage imageNamed:@"Comments.png"];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(myCommentsButtonClicked)];
    
    
    self.navigationItem.rightBarButtonItem = button2;
    
    [button2 release];
    
    [self.view insertSubview:detailsViewController.view belowSubview:myTabBar1];
    
}


-(void)myCommentsButtonClicked {
    
   myCommentsVC = [[CommentsInputViewController alloc] initWithNibName:@"CommentsInputViewController" bundle:nil];
    //Exception thrown at line below
    [navController pushViewController:myCommentsVC animated:YES];
    
    [myCommentsVC release];
    
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