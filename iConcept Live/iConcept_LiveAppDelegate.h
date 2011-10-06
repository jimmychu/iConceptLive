//
//  iConcept_LiveAppDelegate.h
//  iConcept Live
//
//  Created by Jia Zhu on 16/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iConcept_LiveAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    UINavigationController *navController; //navigation controller
}

@property (nonatomic, retain) IBOutlet UIWindow *window;




@end
