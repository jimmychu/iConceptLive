//
//  ShareViewController.h
//  OZLotto Expert
//
//  Created by Jia Zhu on 10/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController{
    
    IBOutlet UIWebView *webview;
    UIActivityIndicatorView *loadingIndicator;
    IBOutlet UILabel *loading;
}

@property (nonatomic, retain) IBOutlet UIWebView *webview;
@end