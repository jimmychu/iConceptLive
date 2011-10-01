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
    int total;
     IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) IBOutlet UILabel *categoryName;
@property (nonatomic, retain) IBOutlet UILabel *categoryNameValue;
@property (retain, nonatomic) NSString* responseString;
@property (nonatomic, retain) NSMutableArray	*resultsArray;
@property int total;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@end




