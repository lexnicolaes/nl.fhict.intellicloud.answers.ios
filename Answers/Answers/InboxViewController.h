//
//  InboxViewController.h
//  Answers
//
//  Created by Lex Nicolaes on 03-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

@interface InboxViewController : BaseTableViewController

@property (strong, nonatomic) NSMutableArray *tableData;

/**
 * Apply a NSPredicate to the table data and reload the table
 * @param predicate to use
 */
- (void)filterTableWithPredicate:(NSPredicate *)predicate;

@end
