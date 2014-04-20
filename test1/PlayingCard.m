//
//  PlayingCard.m
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//overwriting the same method in parent(Card)
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if([otherCards count] == 1){
        //first object returns first obejct in the array, if its empty, returns nil
        // below [otherCards firstObject] returns id object, which is dangerous
        //hence we use below method to make it explict in obj type
        //PlayingCard *otherCard = [otherCards firstObject];
        
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *)card;
            if([self.suit isEqualToString:otherCard.suit]) {
                score = 1;
            } else if (self.rank == otherCard.rank) {
                score = 4;
            }
        }
    }
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
//if we define the setter and getter, we need to implement the synthesize
@synthesize suit = _suit;

//+ means class method, means send to class, not instance
//used in two things: create thigns, or utility things
//normally for readability, not for performance
+ (NSArray *)validSuits
{
    return @[@"♥",@"♣",@"♦",@"♠"];
}


//suit setter
- (void)setSuit:(NSString *)suit
{
    //if([@[@"♥",@"♣",@"♦",@"♠"] containsObject:suit]){ is replace by below after add the class method above -> + (NSarray *)validSuits
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

//suit getter
- (NSString *)suite
{
    return _suit ? _suit :@"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return ([[self rankStrings] count] -1);
}

- (void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}





@end
