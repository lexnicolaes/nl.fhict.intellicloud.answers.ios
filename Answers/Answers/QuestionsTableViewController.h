//
//  QuestionsTableViewController.h
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FormatterKit/TTTTimeIntervalFormatter.h>
#import <FormatterKit/TTTColorFormatter.h>
#import "Question.h"

@interface QuestionsTableViewController : UITableViewController

@property (readwrite, nonatomic, strong) NSMutableArray *questions;

@end
