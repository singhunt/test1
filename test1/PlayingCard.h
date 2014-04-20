//
//  PlayingCard.h
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
