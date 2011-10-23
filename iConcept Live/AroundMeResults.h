//
//  AroundMeResults.h
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//results tab controller
@interface AroundMeResults : UIViewController{
    NSString *responseString;
    NSMutableArray *resultsArray;
    NSMutableArray *addressArray;
    NSMutableArray *retailerIDArray;
    int total;
    IBOutlet UITableView *AroundMeResultstableView;
    UINavigationController *navController;
    NSMutableData* responseData;
}

@property (retain, nonatomic) NSString* responseString;
@property (nonatomic, retain) NSMutableArray	*resultsArray;
@property (nonatomic, retain) NSMutableArray	*addressArray;
@property (nonatomic, retain) NSMutableArray	*retailerIDArray;
@property int total;
@property (nonatomic, retain) IBOutlet UITableView *AroundMeResultstableView;
@property (retain, nonatomic) NSMutableData* responseData;
@property (nonatomic, retain) UINavigationController *navController;
@end




