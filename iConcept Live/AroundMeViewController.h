//
//  AroundMeViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 17/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AroundMeViewController : UIViewController <UITabBarDelegate>{
   IBOutlet UITableView *tableView;
    NSMutableArray *categoryArray;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain)			NSMutableArray	*categoryArray;
@end
