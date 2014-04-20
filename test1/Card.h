//
//  Card.h
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import <Foundation/Foundation.h>  //old style before iOS 7
//@import Foundation; new style import of an entire framework >= iOS 7

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *) otherCard;

@end
