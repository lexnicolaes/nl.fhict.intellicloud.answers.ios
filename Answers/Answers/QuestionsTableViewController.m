//
//  QuestionsTableViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "QuestionsTableViewController.h"
#import "MenuViewController.h"

@interface QuestionsTableViewController ()

@end

/**
 * TableView for holding questions
 */
@implementation QuestionsTableViewController

/*
 * @brief set formatting of table on VC load
 */
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
    
    // Static height for tableviewcell, see storyboard
    self.tableView.rowHeight = QuestionTableCellHeight;
    
    if (IS_IPHONE)
    {
        //Present LoginViewController if not logged in
        if (![[AuthenticationManager sharedClient] checkAutentication])
        {
            [self.navigationController presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"loginViewController"] animated:NO completion:nil];
        }
    }
    
    // Load questions for view
    //[self reload:nil];
}

/**
 * @brief Loads data from the webservice and reloads the tableview
 */
- (bool)reload:(__unused id)sender
{
    // return state succeesed/failed
    __block bool state = NO;
    
    // retrieve data from webservice
    [Question getQuestionsWithBlock:^(NSArray *questions, NSError *error)
    {
        // Get questions data, use copy to get NSArray from NSMutableArray
        _rawData = [questions copy];
            
        // Apply predicate
        [self filterTableWithPredicate];
            
        state = !error;
    }];

    //_rawData = [Question getDummyData];
    //_tableData = [_rawData filteredArrayUsingPredicate:_predicate];
    //[self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
    return state;
}

/**
 * @brief Reloads data for background fetch
 */
/*- (void)reloadForFetchWithCompletionHandler:(void(^)(UIBackgroundFetchResult))completionHandler
{
    UIBackgroundFetchResult result = UIBackgroundFetchResultFailed;
    
    if ([self reload:nil])
    {
        result = UIBackgroundFetchResultNewData;
    }
    
    completionHandler(result);
}*/

#pragma mark - Table view data source

/**
 * Apply the NSPredicate to the table data and reload the table
 */
-(void)filterTableWithPredicate
{
    if (!_predicate)
    {
        // Default predicate when no existing is set
        _predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    }
    
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"creationTime"
                                        ascending:NO];
    
    // Apply predicate
    _tableData = [[_rawData filteredArrayUsingPredicate:_predicate] sortedArrayUsingDescriptors:@[dateDescriptor]];
    
    // Reload the table
    [self.tableView reloadData];
}

/**
 * Apply a NSPredicate to the table data
 * @param predicate to use
 */
- (void)filterTableWithPredicate:(NSPredicate *)predicate
{
    // Set predicate
    _predicate = predicate;
    
    [self filterTableWithPredicate];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Count nr of items in questions array
    return (NSInteger)[_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get question for this row
    Question *question = (Question *)[_tableData objectAtIndex:indexPath.row];
    
    // Get author label from storyboard
    UILabel *authorLabel = (UILabel *)[cell.contentView viewWithTag:100];
    
    // Set author label
    NSString *authorText = NSLocalizedString(@"Unknown user", nil);
    if (question.questionUser.firstname != nil && question.questionUser.lastname != nil)
    {
        // Prepare infix, add suffix space when we have a infix
        NSString *infix = question.questionUser.infix != nil ? [NSString stringWithFormat:@" %@ ", question.questionUser.infix] : @" ";
        authorText = [NSString stringWithFormat:@"%@%@%@", question.questionUser.firstname, infix, question.questionUser.lastname];
    }
    else
    {
        Source *mailSource = nil;
        @try
        {
            NSPredicate *mailPredicate = [NSPredicate predicateWithFormat:@"sourceDefinition.name == %@", @"Mail"];
            mailSource = [[question.questionUser.sources filteredArrayUsingPredicate:mailPredicate] firstObject];
        }
        @catch (NSException *exception)
        {
            NSLog(@"Whups: %@", exception);
        }
        @finally
        {
            if (mailSource != nil)
            {
                authorText = [NSString stringWithFormat:@"<%@>", mailSource.value];
            }
        }
    }
    authorLabel.text = authorText;
    
    // Get time label from storyboard
    UILabel *timeLabel = (UILabel *)[cell.contentView viewWithTag:110];
    
    // Set time label (static for now)
    TTTTimeIntervalFormatter *timeFormatter = [[TTTTimeIntervalFormatter alloc] init];
    timeLabel.text = [timeFormatter stringForTimeIntervalFromDate:[NSDate date] toDate:question.creationTime];
    
    // Get icon imageview from storyboard
    //UIImageView *iconImageView = (UIImageView *)[cell.contentView viewWithTag:120];
    
    // Get question label from storyboard
    UILabel *questionLabel = (UILabel *)[cell.contentView viewWithTag:130];
    
    // Set question label
    questionLabel.text = question.content;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Only used for iPad version
    if (IS_IPAD)
	{
		// Get reference to answerDetailViewController
		AnswerDetailViewController *answerDetailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"answerDetailViewController"];
		
		// Get reference to question
		Question *selectedQuestion = (Question *)[_tableData objectAtIndex:self.tableView.indexPathForSelectedRow.row];
		answerDetailViewController.selectedQuestion = selectedQuestion;
		
		// Replace detail viewController
		MainNavigationController *navController = [[MainNavigationController alloc] initWithRootViewController:answerDetailViewController];
		
		// Get array of viewControllers
		NSArray * viewControllers = self.splitViewController.viewControllers;
		
		// Replace array with new navigationController object
		NSArray * newViewControllers = [NSArray arrayWithObjects:[viewControllers objectAtIndex:0], navController, nil];
		[self.splitViewController setViewControllers:newViewControllers];
    }
}

/*- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Static height for tableviewcell, see storyboard
    return 82.0f;
}*/

#pragma mark - Navigation

// Send the selected question to the QuestionDetailController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Only used for iPhone version
	if(IS_IPHONE)
	{
		NSLog(@"%s", __PRETTY_FUNCTION__);
		// Pass selectedQuestion to AnswerDetailViewController
		AnswerDetailViewController *questionDetailController = segue.destinationViewController;
		Question *selectedQuestion = (Question *)[_tableData objectAtIndex:self.tableView.indexPathForSelectedRow.row];
		questionDetailController.selectedQuestion = selectedQuestion;
	}
}

- (void)reloadForFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
	
}

@end
