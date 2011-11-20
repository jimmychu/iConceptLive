//
//  CategoryViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 20/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController <UITabBarDelegate>{
    IBOutlet UITableView *categoryViewtableView;
    
    NSMutableArray *categoryArray; //display retailer category
    
    NSMutableData* responseData; //use to store data from server
    
    NSString *responseString;
    NSURLConnection *_connection;
}

@property (nonatomic, retain) IBOutlet UITableView *categoryViewtableView;
@property (nonatomic, retain) NSMutableArray *categoryArray;
@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;

@end
