//
//  CustomTableCell.m
//  iConcept Live
//
//  Created by Jia Zhu on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell
@synthesize name;
@synthesize address;
@synthesize retailerID;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
