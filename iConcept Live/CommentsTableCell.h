//
//  CommentsTableCell.h
//  iConcept Live
//
//  Created by Jia Zhu on 18/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CommentsTableCell : UITableViewCell{
    IBOutlet UILabel *message;
    IBOutlet UILabel *name;
    IBOutlet UILabel *publishedtime;
    
}
@property (nonatomic, retain) IBOutlet UILabel *message;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *publishedtime;

@end