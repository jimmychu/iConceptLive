//
//  MoreViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 15/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareViewController.h"
#import "AboutViewController.h"

@interface MoreViewController : UIViewController <UITabBarDelegate>{
    UITabBar *myTabBar2;
    ShareViewController *shareVC;
    AboutViewController *aboutVC;
}

@property (nonatomic, retain) IBOutlet UITabBar *myTabBar2;


@end


