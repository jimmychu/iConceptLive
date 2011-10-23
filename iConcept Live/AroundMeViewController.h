//
//  AroundMeViewController.h
//  iConcept Live
//  View Controller to list all different categories
//  Created by Jia Zhu on 17/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//around me control screen, aroundme is a flow to display retailers around user current location
@interface AroundMeViewController : UIViewController <UITabBarDelegate>{
    IBOutlet UITableView *aroundMeViewtableView;
    
    NSMutableArray *categoryArray; //display retailer category
    
    NSMutableData* responseData; //use to store data from server
    
    NSString *responseString;
}

@property (nonatomic, retain) IBOutlet UITableView *aroundMeViewtableView;
@property (nonatomic, retain) NSMutableArray *categoryArray;
@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;

@end
