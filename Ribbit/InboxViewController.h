//
//  InboxViewController.h
//  Ribbit
//
//  Created by thibaut noah on 31/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPLayer.h>

@interface InboxViewController : UITableViewController

@property (strong, nonatomic) NSArray *messages;
@property (strong, nonatomic) PFObject *selectedMessage;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;

- (IBAction)logout:(id)sender;


@end
