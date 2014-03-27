//
//  CardMatchingGame.h
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer (how many cards - a deck) - required
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;
// an index into cards to have access to list of cards
// does most of the work
- (void)flipCardAtIndex:(NSUInteger)index;
// to get a specific card
- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score; // public


@end
