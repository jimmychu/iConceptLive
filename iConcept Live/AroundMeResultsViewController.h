//
//  AroundMeResultsViewController.h
//  
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//aroundme results view to hold tab bar
@interface AroundMeResultsViewController : UIViewController <UITabBarDelegate>{
    UITabBar *myTabBar;
    UIViewController *currentViewController; //get track with current tab view controller
    NSString *responseString;
    UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UITabBar *myTabBar;

@property (nonatomic, retain) UIViewController *currentViewController;

@property (retain, nonatomic) NSString* responseString;

@property (nonatomic, retain) UINavigationController *navController;


@end