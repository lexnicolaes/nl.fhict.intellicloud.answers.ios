//
//  ReviewDetailViewController.m
//  Answers
//
//  Created by Paul Poos on 04-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "AnswerDetailViewController.h"

@interface AnswerDetailViewController ()

@end

@implementation AnswerDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set questionLabel localized string
    _questionLabel.text = NSLocalizedString(@"QUESTION", nil);
    
    // Set answerLabel localized string
    _answerLabel.text = NSLocalizedString(@"ANSWER", nil);
    
    // Set sendAnswer localized string
    _sendAnswer.titleLabel.text = NSLocalizedString(@"Send answer", nil);
    
    // Set reviewByColleague localized string
    _reviewByColleague.titleLabel.text = NSLocalizedString(@"Review by colleague", nil);
    
}

/**
 * Action to send answer
 * @param action sender
 */
- (IBAction)sendAnswerClick:(id)sender {
}

/**
 * Action to review by colleague
 * @param action sender
 */
- (IBAction)reviewByColleagueClick:(id)sender {
}
@end
