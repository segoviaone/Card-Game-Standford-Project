//
//  CardGameViewController.m
//  MatchingPaulExample
//
//  Created by mcm2737 on 9/23/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()

// weak because view keeps strong pointer so if view goes away you don't need the variable (Labels that hold values)
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (nonatomic) int flipCount;
// strong pointers to arrays
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) GameResult *gameResult;


@end

@implementation CardGameViewController

// LI

- (GameResult *)gameResult
{
    if (!_gameResult) _gameResult = [[GameResult alloc] init];
    return _gameResult;
}


// Lazy Instantiation
- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc]init]];
    return _game;
}

// setter for cardButtos property defined above
- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons; // setter
    [self updateUI];
}

- (void)updateUI  // Updates the UI based upon the model (makes the UI match the model)
{
    // take state of model and update UI - a controller fundamental job
    for (UIButton *cardButton in self.cardButtons) {
        // maps between controller and UI
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // setting title when selected and disabled at the same time
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        // set side
        cardButton.selected = card.isFaceUp;
        // not playable
        cardButton.enabled = !card.isUnplayable;
        //
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}



-(void) setFlipCount:(int)flipCount
// flips are being managed on the UI side (not a model thing)
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    // Array of cardbuttons for the array of those cardbuttons
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI]; // updates UI every time a card is flipped
    self.gameResult.score = self.game.score;
    
}

- (IBAction)deal {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
