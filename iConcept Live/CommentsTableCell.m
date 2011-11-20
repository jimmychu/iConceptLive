//
//  CommentsTableCell.m
//  BNL
//
//  Created by Jia Zhu on 9/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CommentsTableCell.h"

@implementation CommentsTableCell
@synthesize message;
@synthesize name;
@synthesize publishedtime;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end