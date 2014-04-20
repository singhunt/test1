//
//  Card.m
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card


- (int)match:(NSArray *)otherCard
{
    int score = 0;
    
    for(Card *card in otherCard){
    
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}



@end
