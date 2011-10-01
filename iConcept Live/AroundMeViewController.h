//
//  AroundMeViewController.h
//  iConcept Live
//  View Controller to list all different categories
//  Created by Jia Zhu on 17/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AroundMeViewController : UIViewController <UITabBarDelegate>{
   IBOutlet UITableView *tableView;
    NSMutableArray *categoryArray;
    NSMutableData* responseData;
    NSString *responseString;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain)			NSMutableArray	*categoryArray;
@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;
@end
