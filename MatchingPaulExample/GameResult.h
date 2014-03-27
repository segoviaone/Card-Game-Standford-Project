//
//  GameResult.h
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/26/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults; // of Game Result

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property   (nonatomic) int score;


@end
