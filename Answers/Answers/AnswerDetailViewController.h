//
//  ReviewDetailViewController.h
//  Answers
//
//  Created by Paul Poos on 04-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerDetailViewController : UIViewController

/**
 * @property sendAnswer
 * @brief Send Answer button
 */
@property (strong, nonatomic) IBOutlet UIButton *sendAnswer;

/**
 * @property reviewByColleague
 * @brief Review by colleague button
 */
@property (strong, nonatomic) IBOutlet UIButton *reviewByColleague;

/**
 * @property questionLabel
 * @brief Textlabel for question
 */
@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

/**
 * @property questionTextbox
 * @brief Textbox for question
 */
@property (strong, nonatomic) IBOutlet UITextView *questionTextbox;

/**
 * @property answerLabel
 * @brief Textlabel for answer
 */
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;

/**
 * @property answerTextbox
 * @brief Input textbox for answer
 */
@property (strong, nonatomic) IBOutlet UITextView *answerTextbox;

/**
 * Action to send answer
 * @param action sender
 */
- (IBAction)sendAnswerClick:(id)sender;

/**
 * Action to review by colleague
 * @param action sender
 */
- (IBAction)reviewByColleagueClick:(id)sender;

@end
