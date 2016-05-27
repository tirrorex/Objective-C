//
//  FactBook.h
//  FunFacts
//
//  Created by thibaut noah on 26/07/15.
//  Copyright (c) 2015 Web-improving. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FactBook : NSObject
@property (strong, nonatomic) NSArray *facts;
- (NSString *)randomFact;
@end
