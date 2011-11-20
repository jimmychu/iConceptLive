//
//  HomeViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 16/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
//The first screen of the application
@interface HomeViewController : UIViewController <CLLocationManagerDelegate>{
    NSMutableData* responseData; //use to store data from server
     CLLocationManager *lm;
    NSString *responseString;
    NSURLConnection *_connection;
    NSString *lat;
    NSString *lng;
}

@property (retain, nonatomic) NSString* responseString;
@property (retain, nonatomic) NSMutableData* responseData;

- (IBAction)pushViewController:(id)sender;

@end

