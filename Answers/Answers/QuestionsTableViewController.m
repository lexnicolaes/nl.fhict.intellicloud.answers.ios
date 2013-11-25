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

    // DEBUG
    // Add some dummy questions
    _questions = [[NSMutableArray alloc] init];
    
    Question *q1 = [[Question alloc] init];
    q1.questionID = 1;
    q1.content = @"foobars!";
    [_questions addObject:q1];
    
    Question *q2 = [[Question alloc] init];
    q2.questionID = 1;
    q2.content = @"Testtest!";
    [_questions addObject:q2];
    //DEBUG
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reload:(__unused id)sender
{
    NSLog(@"Nog niks...");
    
    Question *q = [[Question alloc] init];
    q.questionID = 3;
    q.content = @"Woopwhoop?";
    //[_questions addObject:q];
    [_questions insertObject:q atIndex:0];
    
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.refreshControl endRefreshing];
        
        // Animated reloaddata http://stackoverflow.com/questions/14576921/uitableview-reloaddata-with-animation
        [self.tableView beginUpdates];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    });
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[_questions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"QuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = @"Hoe installeer ik Windows 7?";
    //cell.detailTextLabel.text = @"3 hours ago by Bram Kersten";
    
    UILabel *authorLabel = (UILabel *)[cell.contentView viewWithTag:100];
    authorLabel.text = @"Lex Nicolaes";
    
    UILabel *timeLabel = (UILabel *)[cell.contentView viewWithTag:110];
    timeLabel.text = @"just now";
    
    UILabel *questionLabel = (UILabel *)[cell.contentView viewWithTag:130];
    Question *foo = (Question *)[_questions objectAtIndex:indexPath.row];
    questionLabel.text = foo.content;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 82.0f;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
