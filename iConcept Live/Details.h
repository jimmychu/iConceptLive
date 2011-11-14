//
//  Details.h
//  iConcept Live
//
//  Created by Jia Zhu on 2/10/11.
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
- (id) initWithCoordinate: (CLLocationCoordinate2D) c;

@end

@interface Details : UIViewController{
    
    NSString *RETAILERID; 
    
    
    MKMapView *mapView;    
    NSMutableData* responseData;
    DetailsAddressAnnotation *addAnnotation; 
    UITextView *textView;
    UIScrollView *scrollView;
}


@property (retain, nonatomic)  NSString *RETAILERID; 

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@end
