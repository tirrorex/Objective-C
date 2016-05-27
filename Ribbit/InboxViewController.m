//
//  InboxViewController.m
//  Ribbit
//
//  Created by thibaut noah on 31/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import "InboxViewController.h"
#import "ImageViewController.h"

@interface InboxViewController ()

@end

@implementation InboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moviePlayer = [[MPMoviePlayerController alloc] init];
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser)
    {
//        NSLog(@"Current user: %@", currentUser.username);
    }
    else
    {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Messages"];
    if ([PFUser currentUser] != NULL)
    {
        [query whereKey:@"recipientsIds" equalTo:[[PFUser currentUser] objectId]];
        [query orderByDescending:@"createdAt"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
         {
            if (error)
            {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
            else
            {
                self.messages = objects;
                [self.tableView reloadData];
                NSLog(@"Retrieved %lu messages", (unsigned long)[self.messages count]);
            }
         }];
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *message = [self.messages objectAtIndex:indexPath.row];
    cell.textLabel.text = [message objectForKey:@"senderName"];
    
    NSString *fileType = [message objectForKey:@"fileType"];
    if ([fileType isEqualToString:@"image"])
    {
        cell.imageView.image = [UIImage imageNamed:@"icon_image"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"icon_video"];
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedMessage = [self.messages objectAtIndex:indexPath.row];
    NSString *fileType = [self.selectedMessage objectForKey:@"fileType"];

    if ([fileType isEqualToString:@"image"])
    {

        [self performSegueWithIdentifier:@"showImage" sender:self];
    }
    else
    {
        PFFile *videoFile = [self.selectedMessage objectForKey:@"file"];
        NSURL *fileUrl = [NSURL URLWithString:videoFile.url];
        self.moviePlayer.contentURL = fileUrl;
        [self.moviePlayer prepareToPlay];
        [self.moviePlayer thumbnailImageAtTime:0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        
        // Add it to the view controller so we can see it
        
        [self.view addSubview:self.moviePlayer.view];
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    
    NSMutableArray *recipientsIds = [NSMutableArray arrayWithArray:[self.selectedMessage objectForKey:@"recipientsIds"]];
    NSLog(@"Recipients: %@", recipientsIds);
    if ([recipientsIds count] == 1)
    {
        [self.selectedMessage deleteInBackground];
    }
    else
    {
        [recipientsIds removeObject:[[PFUser currentUser] objectId]];
        [self.selectedMessage setObject:recipientsIds forKey:recipientsIds];
        [self.selectedMessage saveInBackground];
    }
}


#pragma mark - Actions

- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showLogin"])
    {
        InboxViewController *vc = [segue destinationViewController];
        [vc setHidesBottomBarWhenPushed:YES];
        [vc.navigationItem setHidesBackButton:YES animated:YES];
    }
    else if ([segue.identifier isEqualToString:@"showImage"])
    {
        InboxViewController *vc = [segue destinationViewController];
        [vc setHidesBottomBarWhenPushed:YES];
        ImageViewController *imageViewController = (ImageViewController *)segue.destinationViewController;
        imageViewController.message = self.selectedMessage;
    }

}
@end
