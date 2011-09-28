//
//  AroundMeResultsViewController.h
//  
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@interface AroundMeResultsViewController : UIViewController <UITabBarDelegate>{
    UITabBar *myTabBar;
    UIViewController *currentViewController;
    IBOutlet UILabel *categoryName; 
}

@property (nonatomic, retain) IBOutlet UITabBar *myTabBar;

@property (nonatomic, retain) UIViewController *currentViewController;

@property (nonatomic, retain) IBOutlet UILabel *categoryName;


@end