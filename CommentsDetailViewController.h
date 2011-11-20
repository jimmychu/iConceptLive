//
//  CommentsDetailViewController.h
//  BNL
//
//  Created by Jia Zhu on 24/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsDetailViewController : UIViewController{
    IBOutlet UITextView *message;
    IBOutlet UILabel *name;
    IBOutlet UILabel *publishedtime;
    NSString *msg;
    NSString *nam;
    NSString *time;
    
}
@property (nonatomic, retain) IBOutlet UITextView *message;
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *publishedtime;
@property (nonatomic, retain) NSString *msg;
@property (nonatomic, retain) NSString *nam;
@property (nonatomic, retain) NSString *time;
@end