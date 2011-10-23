//
//  DetailsViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 23/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//
//  DetailsViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentsInputViewController.h"

@interface DetailsViewController : UIViewController <UITabBarDelegate>{
    UITabBar *myTabBar1;
    UIViewController *currentViewController;
    NSString *commentsData;
    NSString *responseString;
    NSString *RETAILERID;
    CommentsInputViewController *myCommentsVC;
    UINavigationController *navController;
    
    NSMutableData* responseData;
    
}

@property (nonatomic, retain) IBOutlet UITabBar *myTabBar1;

@property (nonatomic, retain) UIViewController *currentViewController;

@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic)  NSString *RETAILERID;
@property (retain, nonatomic) NSString* commmentsData;
@property (nonatomic, retain) CommentsInputViewController *myCommentsVC;
@property (nonatomic, retain) UIViewController *navController;

@property (retain, nonatomic) NSMutableData* responseData;



@end