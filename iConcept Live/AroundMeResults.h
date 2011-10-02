//
//  AroundMeResults.h
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AroundMeResults : UIViewController{
     IBOutlet UILabel *categoryName;
    IBOutlet UILabel *categoryNameValue;
     NSString *responseString;
    NSMutableArray *resultsArray;
      NSMutableArray *addressArray;
    int total;
     IBOutlet UITableView *tableView;
    UINavigationController *navController;
     NSMutableData* responseData;
}

@property (nonatomic, retain) IBOutlet UILabel *categoryName;
@property (nonatomic, retain) IBOutlet UILabel *categoryNameValue;
@property (retain, nonatomic) NSString* responseString;
@property (nonatomic, retain) NSMutableArray	*resultsArray;
@property (nonatomic, retain) NSMutableArray	*addressArray;
@property int total;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableData* responseData;
@property (nonatomic, retain) UINavigationController *navController;
@end




