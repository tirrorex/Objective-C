//
//  PhotoController.h
//  PhotoBombers
//
//  Created by thibaut noah on 05/08/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *)size completion:(void(^)(UIImage *image))completion;

@end
