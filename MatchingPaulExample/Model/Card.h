//
//  Card.h
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)othercards;

@end
