//
//  DetailsMapViewController.h
//  BNL
//
//  Created by Jia Zhu on 22/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>



@interface DetailsAddressAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subtitle;
    
}
-(NSString *)title;
-(NSString *)subtitle;
-(void) setTitle:(NSString *)titleValue;
-(void) setSubTitle:(NSString *)subtitleValue;

@end

@interface DetailsMap : UIViewController{
    
    MKMapView *mapView;    
    NSMutableData* responseData;
    DetailsAddressAnnotation *addAnnotation; 
    NSString *RETAILERID; 
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (retain, nonatomic)  NSString *RETAILERID;

//- (IBAction)showAddress;

@end
