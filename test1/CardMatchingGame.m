//
//  CardMatchingGame.m
//  test1
//
//  Created by Wei on 2/4/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic,readwrite) NSInteger score;
@property(nonatomic,strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards) _cards= [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    if(self){
        for( int i=0; i< count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

//define constant
#define MISMATCH_PENALTY 2;
#define MATCH_BONUS 4;
#define COST_TO_CHOOSE 1;
//another way
//static const int MISMATCH_PENALTY = 2;
- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if(card.isChosen){
            card.chosen = NO;
        } else {
            //match against anotehr card
            for( Card *othercard in self.cards){
                if(othercard.isChosen && !othercard.isMatched){
                    int matchScore = [card match:@[othercard]];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        othercard.matched = YES;
                    } else {
                        othercard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
