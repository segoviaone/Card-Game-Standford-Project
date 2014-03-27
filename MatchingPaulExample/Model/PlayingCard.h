//
//  PlayingCard.h
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
