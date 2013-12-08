//
//  MenuViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 02-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "MenuViewController.h"
#import "Question.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup table data
    _menuItems = @[
                   @[
                       @{@"title": NSLocalizedString(@"Inbox", nil), @"icon": @"", @"predicate": [NSPredicate predicateWithFormat:@"questionState == %d", QuestionStateUpForAnswer]},  //implement predicates
                       @{@"title": NSLocalizedString(@"Open", nil), @"icon": @"MenuIconOpen", @"predicate": [NSPredicate predicateWithFormat:@"questionState == %d", QuestionStateOpen]},
                       @{@"title": NSLocalizedString(@"Rejected", nil), @"icon": @"MenuIconRejected", @"predicate": @"rejectedViewController"},
                       @{@"title": NSLocalizedString(@"Pending", nil), @"icon": @"MenuIconPending", @"predicate": @"pendingViewController"},
                       @{@"title": NSLocalizedString(@"In review", nil), @"icon": @"MenuIconReview", @"predicate": @"reviewViewController"}],
                   @[
                       @{@"title": NSLocalizedString(@"About IntelliCloud", nil), @"icon": @"", @"id": @"aboutViewController"}],  ///rename id to storyboard id?
                   @[
                       @{@"title": NSLocalizedString(@"Sign out", nil), @"icon": @"MenuIconSignOut", @"action": @"inboxViewController"}]];  //implement action
    
    // TableView settings
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = YES;
    self.tableView.scrollsToTop = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.scrollEnabled = NO;
	
	// Static height for tableviewcell, see storyboard
    self.tableView.rowHeight = MenuTableCellHeight;
    
    // Set avatar for authenticated user
    // todo: retrieve dynamically from AuthenticationManager or backend
    _currentUserImageView.clipsToBounds = YES;
    _currentUserImageView.layer.cornerRadius = _currentUserImageView.frame.size.width / 2; // half of the width
    _currentUserImageView.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.55f].CGColor;
    _currentUserImageView.layer.borderWidth = 0.7f;
    [_currentUserImageView setImageWithURL:[NSURL URLWithString:@"http://guessthelighting.com/wp-content/uploads/2012/02/steve_jobs_albert-watson.jpg"] placeholderImage:[UIImage imageNamed:@"UserIcon"]];
    
    // Set name for for authenticated user
    // todo: retrieve dynamically from AuthenticationManager or backend
    _currentUserLabel.text = @"Steven Paul Jobs";
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Deselect row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // Get data item for this row
    NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    // Get navigation controller for sliding menu
    UINavigationController *navigationController = (UINavigationController *)self.sideMenuViewController.contentViewController;
	
    // Get root view of navigation controller
    UIViewController *rootView = navigationController.viewControllers[0];

    //NSStringFromClass([)
    
    
    // Check for @vc property... current vc == target vc do nothing, else make a new one and push it
    
    // do we have a @predicate? set it
    if ([rootView respondsToSelector:@selector(filterTableWithPredicate:)] && [[itemForRow objectForKey:@"predicate"] isKindOfClass:[NSPredicate class]])
    {
        NSLog(@"Setting predicate %@", (NSPredicate *)[itemForRow objectForKey:@"predicate"]);
        QuestionsTableViewController *questionsTable = (QuestionsTableViewController *)rootView;
        [questionsTable filterTableWithPredicate:(NSPredicate *)[itemForRow objectForKey:@"predicate"]];
    }
    else
    {
        
    }
    
    // do we have an action? run it
    
    // set title, maybe check for @nav_title property first?
    rootView.title = (NSString *)[itemForRow objectForKey:@"title"];
    
    // we just assume there is one "special" property in the data source
    
	// Get item for this row
    //NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	// Instantiate vc from the storyboard using id from datasource
    //navigationController.viewControllers = @[[self.storyboard instantiateViewControllerWithIdentifier:[itemForRow valueForKey:@"id"]]];
	
	// Hide the side menu
    [self.sideMenuViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// Return the number of sections
    return [_menuItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
	// Return the number of rows in the section
    return [[_menuItems objectAtIndex:sectionIndex] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier  forIndexPath:indexPath];
	
	// Custom view for the cell background when selected cell
	UIView *cellBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
	// White background color with transparency
	cellBackgroundView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.3];
	// Set custom view to selectedBackgroundView
	cell.selectedBackgroundView = cellBackgroundView;
	
	// Get item for this row from datasource
	NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	
	if (![(NSString*)[itemForRow valueForKey:@"icon"] isEqualToString:@""])
	{
		// Get icon imageview from storyboard
		UIImageView *titleImageView = (UIImageView *)[cell.contentView viewWithTag:101];
		// Get icon image from datasource
		UIImage *titleImage = [UIImage imageNamed:[itemForRow valueForKey:@"icon"]];
		// Set image to icon imageview
		[titleImageView setImage:titleImage];
	}
	
	// Get label from storyboard
	UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:102];
	titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.text = [itemForRow valueForKey:@"title"];
    
    return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

