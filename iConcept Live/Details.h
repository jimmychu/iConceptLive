//
//  Details.h
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Details : UIViewController{
    
    NSString *RETAILERID; 
    
    IBOutlet UILabel *RETAILERINFO;
    
    IBOutlet UILabel *RETAILERADDRESS;
    
    IBOutlet UILabel *HOMEPAGE;
}


@property (retain, nonatomic)  NSString *RETAILERID; 

@property (retain, nonatomic)  IBOutlet UILabel *RETAILERINFO;

@property (retain, nonatomic)  IBOutlet UILabel *RETAILERADDRESS;

@property (retain, nonatomic)  IBOutlet UILabel *HOMEPAGE;
@end
