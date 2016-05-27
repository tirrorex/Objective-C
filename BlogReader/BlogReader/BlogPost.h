//
//  BlogPost.h
//  BlogReader
//
//  Created by thibaut noah on 29/07/15.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *thumbnail;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

// Designated Initializer
- (id) initWithTitle:(NSString*)title;
// Convenience constructor
+ (id) blogPostWithTitle:(NSString *)title;

- (NSURL *) thumbnailURL;
- (NSString *) formattedDate;
@end
