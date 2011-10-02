//
//  CustomTableCell.h
//  iConcept Live
//
//  Created by Jia Zhu on 1/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomTableCell : UITableViewCell{
    IBOutlet UILabel *name;
    IBOutlet UILabel *address;
    IBOutlet UILabel *retailerID;
    
}

@property (nonatomic, retain) IBOutlet UILabel *name;


@property (nonatomic, retain) IBOutlet UILabel *address;
@property (nonatomic, retain) IBOutlet UILabel *retailerID;

@end
