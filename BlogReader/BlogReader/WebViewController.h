//
//  WebViewController.h
//  BlogReader
//
//  Created by thibaut noah on 30/07/15.
//  Copyright (c) 2015 Amit Bijlani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURL *blogPostURL;
@end
