//
//  QuestionsTableViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "QuestionsTableViewController.h"

@interface QuestionsTableViewController ()

@end

@implementation QuestionsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set table seperator inset to line up with content text
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0.0f, 50.0f, 0.0f, 0.0f)];
    
    // Add pull to refresh control
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    refresh.tintColor = [UIColor tableTintColor];
    self.refreshControl = refresh;
    
    TTTColorFormatter *cf = [[TTTColorFormatter alloc] init];
    self.tableView.backgroundColor = [cf colorFromHexadecimalString:@"#fcfcfc"];
    
    // Set title
    self.title = NSLocalizedString(@"Questions", nil);
    
    // Load questions for view
    [self reload:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * Loads data from the webservice and reloads the tableview
 */
- (void)reload:(__unused id)sender
{
    [Question getQuestionsWithBlock:^(NSArray *questions, NSError *error) {
        if (!error)
        {
            self.questions = (NSMutableArray *)questions;
            [self.tableView reloadData];
        }
    }];
    
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[_questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Question *question = (Question *)[_questions objectAtIndex:indexPath.row];
    
    UILabel *authorLabel = (UILabel *)[cell.contentView viewWithTag:100];
    NSString *infix = question.questionUser.infix ? [NSString stringWithFormat:@"%@ ", question.questionUser.infix] : nil;
    authorLabel.text = [NSString stringWithFormat:@"%@ %@%@", question.questionUser.firstname, infix, question.questionUser.lastname];
    
    UILabel *timeLabel = (UILabel *)[cell.contentView viewWithTag:110];
    timeLabel.text = @"just now";
    
    UILabel *questionLabel = (UILabel *)[cell.contentView viewWithTag:130];
    
    questionLabel.text = question.content;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82.0f;
}

@end
