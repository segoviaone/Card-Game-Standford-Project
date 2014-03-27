//
//  Deck.m
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "Deck.h"

@interface Deck()
// private properties just for us to use
@property (strong,nonatomic) NSMutableArray *cards; // sub class of arrays - you can add objects to it

@end

@implementation Deck

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
    
}


- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    // to see symbol nil (a pointer that does not point to anything (unnecessary just an example)
    // self is like this in Visuall C++
    if (self.cards.count){
    unsigned index = arc4random() % self.cards.count;
    randomCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
    
}

@end
