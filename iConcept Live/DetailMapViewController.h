//
//  DetailMapViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 13/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DetailMapViewController : UIViewController <CLLocationManagerDelegate>{
    IBOutlet UIWebView *webview;
    CLLocationManager *lm;
    
    NSString *RETAILERID;
    NSString *lat;
    NSString *lng;
}
@property (nonatomic, retain) IBOutlet UIWebView *webview;
@property (retain, nonatomic)  NSString *RETAILERID; 
@end
