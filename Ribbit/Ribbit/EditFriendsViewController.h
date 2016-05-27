//
//  EditFriendsViewController.h
//  Ribbit
//
//  Created by thibaut noah on 01/08/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsViewController : UITableViewController
@property (strong, nonatomic) NSArray *allusers;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser *)user;

@end
