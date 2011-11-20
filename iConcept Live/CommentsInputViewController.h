//
//  CommentsInputViewController.h
//  iConcept Live
//
//  Created by Jia Zhu on 10/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsInputViewController : UIViewController{


UINavigationController *navController;
IBOutlet UITextView *comments;
IBOutlet UITextField *name;
NSString *pubid;
UIScrollView *scrollView;
IBOutlet UILabel *namelabel;
IBOutlet UILabel *commentslabel;
IBOutlet UIButton *shout;
IBOutlet UILabel *thanslabel;
NSURLConnection *_connection;
}

@property (nonatomic, retain) IBOutlet UITextView *comments;
@property (nonatomic, retain) IBOutlet UITextField *name;
@property (nonatomic, retain) IBOutlet UILabel *namelabel;
@property (nonatomic, retain) IBOutlet UILabel *thankslabel;
@property (nonatomic, retain) IBOutlet UIButton *shout;
@property (nonatomic, retain) IBOutlet UILabel *commentslabel;
@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic, retain) NSString *pubid;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (IBAction)InsertComments:(id)sender;
@end