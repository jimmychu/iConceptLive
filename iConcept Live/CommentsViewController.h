//
//  CommentsViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsViewController : UIViewController{
    IBOutlet UITableView *tableView1;
    NSString *responseString;
    int total;
    NSMutableArray *resultsArray;
}
@property (nonatomic, retain) IBOutlet UITableView *tableView1;

@property (retain, nonatomic) NSString* responseString;
@property (nonatomic, retain)			NSMutableArray	*resultsArray;
@property int total;

@end