//
//  ImageViewController.h
//  Ribbit
//
//  Created by thibaut noah on 02/08/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property (strong, nonatomic) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
