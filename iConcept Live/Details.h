//
//  Details.h
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface Details : UIViewController{
    
    NSString *RETAILERID; 
    
    
    NSMutableData* responseData;
    
    UITextView *textView;
    UITextView *nameView;
    UITextView *homepageView;
    UITextView *contactView;
    UIScrollView *scrollView;
}


@property (retain, nonatomic)  NSString *RETAILERID; 

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) IBOutlet UITextView *nameView;
@property (nonatomic, retain) IBOutlet UITextView *contactView;
@property (nonatomic, retain) IBOutlet UITextView *homepageView;
@end
