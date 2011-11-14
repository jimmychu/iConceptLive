//
//  AroundMeMapResults.h
//  iConcept Live
//
//  Created by Jia Zhu on 24/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    NSString *subtitle;
    
}
-(NSString *)title;
-(NSString *)subtitle;
-(void) setTitle:(NSString *)titleValue;
-(void) setSubTitle:(NSString *)subtitleValue;
- (id) initWithCoordinate: (CLLocationCoordinate2D) c;

@end

@interface AroundMeMapResults : UIViewController {
    
    MKMapView *mapView;    
    NSMutableData* responseData;
    AddressAnnotation *addAnnotation; 
    NSString *responseString;
    
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (retain, nonatomic) NSMutableData* responseData;
@property (retain, nonatomic) NSString *responseString;



@end