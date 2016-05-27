//
//  PlaylistDetailViewController.h
//  Algorhythm
//
//  Created by thibaut noah on 27/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Playlist;
@interface PlaylistDetailViewController : UIViewController
@property (strong, nonatomic) Playlist *playlist;
@property (weak, nonatomic) IBOutlet UIImageView *playlistCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *playlistTitle;
@property (weak, nonatomic) IBOutlet UILabel *playlistDescription;
@property (weak, nonatomic) IBOutlet UILabel *playlistArtist0;
@property (weak, nonatomic) IBOutlet UILabel *playlistArtist1;
@property (weak, nonatomic) IBOutlet UILabel *playlistArtist2;

@end
