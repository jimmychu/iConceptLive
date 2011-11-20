//
//  CommentsViewController.h
//  BNL
//
//  Created by Jia Zhu on 8/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsViewController : UIViewController{
    IBOutlet UITableView *commentstableView;
    NSString *responseString;
    NSMutableArray *resultsArray;
    NSMutableArray *nameArray;
    NSMutableArray *datetimeArray;
    UINavigationController *navController;
    int total;
}
@property (nonatomic, retain) IBOutlet UITableView *commentstableView;
@property int total;
@property (retain, nonatomic) NSString* responseString;
@property (nonatomic, retain)			NSMutableArray	*resultsArray;
@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic, retain)			NSMutableArray	*nameArray;
@property (nonatomic, retain)			NSMutableArray	*datetimeArray;
@end
