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
#import "BaseTableViewController.h"
#import "Question.h"
#import "QuestionDetailViewController.h"

NS_ENUM(NSUInteger, webServiceDataState)
{
    webServiceDataStateNoData,
    webServiceDataStateNewData,
    webServiceDataStateFailed
};

/**
 * TableViewCell height for question
 */
static CGFloat const QuestionTableCellHeight = 82.0f;

/**
 * TableView for holding questions
 */
@interface QuestionsTableViewController : BaseTableViewController

/**
 * @property tableData
 * @brief Holds questions to be shown in the TableView, values are loaded from WS
 */
@property (readwrite, strong, nonatomic) NSPredicate *predicate;
@property (readwrite, strong, nonatomic) NSMutableArray *rawData;
@property (readwrite, strong, nonatomic) NSArray *tableData;

/**
 * @brief Loads data from the webservice and reloads the tableview
 * @param sender of the object (unused)
 */
- (bool)reload:(__unused id)sender;

/**
 * @brief Reloads data for background fetch
 * @param UIBackgroundFetchResult completion handler block
 */
- (void)reloadForFetchWithCompletionHandler:(void(^)(UIBackgroundFetchResult))completionHandler;

/**
 * Apply a NSPredicate to the table data and reload the table
 * This allows the data the be loaded once and filtering the data for each view mode accordingly
 * @param predicate to use
 */
- (void)filterTableWithPredicate:(NSPredicate *)predicate;

- (NSArray *)getFilteredData;

@end
