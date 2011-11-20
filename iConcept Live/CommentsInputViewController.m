//
//  CommentsInputViewController.m
//  iConcept Live
//
//  Created by Jia Zhu on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommentsInputViewController.h"

@implementation CommentsInputViewController

@synthesize navController;
@synthesize comments;
@synthesize name;
@synthesize pubid;
@synthesize scrollView;
@synthesize namelabel;
@synthesize commentslabel;
@synthesize shout;
@synthesize thankslabel;

- (IBAction)InsertComments:(id)sender{
    
    if(name.text.length < 2 || comments.text.length < 20){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please input your name and the comment must be at least 20 characters long." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [message show];
        [message release];
    }else{
        //insert data
        
        NSString *url = [@"http://www.i-triple.com/bnl/storeshoutoutmessage.php?USERNAME=" stringByAppendingString:name.text];
        
        url = [url stringByAppendingString:@"&MESSAGE="];
        url = [url stringByAppendingString:comments.text];
        url = [url stringByAppendingString:@"&PUBID="];
        url = [url stringByAppendingString:pubid];
        
        url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[_connection release];
    
    
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [_connection release],
    
    name.text = nil;
    comments.text = nil;
    [name release];
    [comments release];
    
    comments.hidden = YES;
    name.hidden = YES;
    namelabel.hidden = YES;
    commentslabel.hidden = YES;
    shout.hidden = YES;
    
    thankslabel.hidden = NO;    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(847, 800);
    thankslabel.hidden = YES;
    [scrollView addSubview:thankslabel];
    [thankslabel release];
    [scrollView addSubview:name];
    [name release];
    [scrollView addSubview:namelabel];
    [namelabel release];
    [scrollView addSubview:commentslabel];
    [commentslabel release];
    [scrollView addSubview:comments];
    [comments release];
    [scrollView addSubview:shout];
    [shout release];
    [self.view addSubview:scrollView];
    //[scrollView release];
}

- (void)dealloc
{
    
    
    [super dealloc];
    [_connection release];
    
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
