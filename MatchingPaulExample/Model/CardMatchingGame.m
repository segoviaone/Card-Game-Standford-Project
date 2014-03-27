//
//  CardMatchingGame.m
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards; // of Cards - logically could be anything
@property (readwrite, nonatomic) int score; // private read write (default) vs public
@end


@implementation CardMatchingGame

// Lazy Instantiation (so at worst it only returns an empty array)
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
{
    self = [super init];
    // you must call your super class's designated initializer from your designated initializer
    // super class is NSObject
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
    // if then statement (if condition)  ? means then  whatever : else
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];  // get the card
    
    if (!card.isUnplayable){
        if (!card.isFaceUp){
            for (Card *otherCard in self.cards) {  // for something in somthing
                // if found another card that is face up and payable
                if (otherCard.isFaceUp && !otherCard.isUnplayable ) {
                    int matchScore = [card match:@[otherCard]]; // @[ ]  makes an array
                        if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;  // super bonus
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                    
                }
            }
            self.score -= FLIP_COST;  // has to pay a cost to flip the card
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
