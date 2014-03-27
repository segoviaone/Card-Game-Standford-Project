//
//  PlayingCard.m
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 1) {
        // if there is only one other card that is playable
        // get the other card out of array  - Example of Introspection
        id otherCard = [otherCards lastObject];
        // now it does not assume that card is a playing Card
        if ([otherCard isKindOfClass:[PlayingCard class]]){
            PlayingCard *otherPlayingCard = otherCard;
        // lastObject never gives array index out of bounds
        if ([otherPlayingCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherPlayingCard.rank == self.rank) {
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

@synthesize suit = _suit; // because we provide setter AND getter
//@synthesize rank = _rank;


+ (NSArray *)validSuits  // class methods start with + (sent to the class) utility methods
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}


- (void)setSuit:(NSString *)suit  // instance methods start with - (sent to instance)
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{

    return _suit ? _suit: @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}



@end
