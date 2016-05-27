//
//  ColorWheel.h
//  FunFacts
//
//  Created by thibaut noah on 26/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColorWheel : NSObject
@property (strong, nonatomic) NSArray *colors;
- (UIColor *)randomcolor;
@end
