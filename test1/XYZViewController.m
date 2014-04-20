//
//  XYZViewController.m
//  test1
//
//  Created by Wei on 31/3/14.
//  Copyright (c) 2014 __Wei__. All rights reserved.
//

#import "XYZViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface XYZViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
//@property (nonatomic) Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation XYZViewController

- (CardMatchingGame *)game
{
    //if use alloc init, it will return just nil, hence use our initwith..
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}
//
//-(Deck *)deck
//{
//    if(!_deck) _deck = [self createDeck];
//    return _deck;
//}
- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


//-(void) setFlipCount:(int)flipCount
//{
//    _flipCount = flipCount;
//    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
//    NSLog(@"flipCount = %d", self.flipCount);
//}

- (IBAction)touchcardButton:(UIButton *)sender
{
    //assignment 1, now all deleted for assignment 2
//    if([sender.currentTitle length]){
//        //sender is the button
//        [sender setBackgroundImage:[UIImage imageNamed:@"SHG_logo"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    }else{
//        //sender is the button
//        
//        Card *card =[self.deck drawRandomCard];
//        
//        if(card){
//            [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
//                          forState:UIControlStateNormal];
//            [sender setTitle:[card contents] forState:UIControlStateNormal];
//            NSLog(@"drawRandomCard contents is %@", [card contents] );
//        self.flipCount++;
//        }
//    }
    
    
    //assignment 2, in lecture 3
    
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons)
    {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardback" : @"SHG_logo"];
}

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
