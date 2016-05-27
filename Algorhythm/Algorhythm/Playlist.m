//
//  Playlist.m
//  Algorhythm
//
//  Created by thibaut noah on 27/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import "Playlist.h"
#import "MusicLibrary.h"

@implementation Playlist

- (instancetype)initWithIndex:(NSUInteger)index
{
    self = [super init];
    if (self)
    {
        MusicLibrary *musicLibrary = [[MusicLibrary alloc] init];
        NSArray *library = musicLibrary.library;
        
        NSDictionary *playListDictionary = library[index];
        _playlistTitle = [playListDictionary objectForKey:kTitle];
        _playlistDescription = [playListDictionary objectForKey:kDescription];
        
        NSString *iconName = [playListDictionary objectForKey:kIcon];
        _playlistIcon = [UIImage imageNamed:iconName];
        
        NSString *largeIconName = [playListDictionary objectForKey:kLargeIcon];
        _playlistIconLarge = [UIImage imageNamed:largeIconName];
        
        _playlistArtists = [NSArray arrayWithArray:[playListDictionary objectForKey:kArtists]];
        
        NSDictionary *colorDictionary = [playListDictionary objectForKey:kBackgroundColor];
        _backgroundColor = [self rgbColorFromDictionary:colorDictionary];
    }
    return self;
}

- (UIColor *)rgbColorFromDictionary:(NSDictionary *)colorDictionary
{
    CGFloat red = [[colorDictionary objectForKey:@"red"] doubleValue];
    CGFloat green = [[colorDictionary objectForKey:@"green"] doubleValue];
    CGFloat blue = [[colorDictionary objectForKey:@"blue"] doubleValue];
    CGFloat alpha = [[colorDictionary objectForKey:@"alpha"] doubleValue];
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

@end
