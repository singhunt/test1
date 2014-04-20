//
//  PlayingCardDeck.m
//  test1
//
//  Created by Wei on 1/4/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    //super class init itself
    self = [super init];
    if (self){
        for (NSString *suit in  [PlayingCard validSuits]) {
            for(NSUInteger rank = 1; rank<= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}


@end
