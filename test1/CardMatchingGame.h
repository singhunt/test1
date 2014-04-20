//
//  CardMatchingGame.h
//  test1
//
//  Created by Wei on 2/4/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//this is my designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

//no setter for score in public
@property(nonatomic,readonly) NSInteger score;

@end
