//
//  LoginViewController.h
//  Ribbit
//
//  Created by thibaut noah on 01/08/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)login:(id)sender;

@end
