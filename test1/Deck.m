//
//  Deck.m
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "Deck.h"

@interface Deck()

//internal data structure to store the cards in
//Mutable means can add objects to the array,
//normal NSArray is immutable, means once created, cannot take any out/in
@property (strong,nonatomic) NSMutableArray *cards;

@end

@implementation Deck


//getter for cards, assign memory to cards
//lazy instantion
-(NSMutableArray *)cards
{
    //great place to check whether the cards is nil, if yes, assign/allocate memory for this variable
    //_cards is automately created
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
//someothermethod which only used in this Deck.m file

-(void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}


-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else {
        //add at the end of the array
        [self.cards addObject:card];
    }
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if([self.cards count])
    {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}



@end
