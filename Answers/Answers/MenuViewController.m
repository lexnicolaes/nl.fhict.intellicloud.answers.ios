//
//  MenuViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 02-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+RESideMenu.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Setup table data
    _menuItems = @[
                   @[
                       @{@"title": @"Alles", @"icon": @"", @"id": @"inboxViewController"},
                       @{@"title": @"Openstaand", @"icon": @"MenuIconOpen", @"id": @"openViewController"},
                       @{@"title": @"Afgekeurd", @"icon": @"MenuIconRejected", @"id": @"rejectedViewController"},
                       @{@"title": @"In behandeling", @"icon": @"MenuIconPending", @"id": @"pendingViewController"},
                       @{@"title": @"Review", @"icon": @"MenuIconReview", @"id": @"reviewViewController"}],
                   @[
                       @{@"title": @"Over IntelliCloud", @"icon": @"", @"id": @"aboutViewController"}],
                   @[
                       @{@"title": @"Afmelden", @"icon": @"", @"id": @"inboxViewController"}]];
    
    // TableView settings
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.bounces = YES;
    self.tableView.scrollsToTop = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Deselect row
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.sideMenuViewController.contentViewController;
	
	// Get item for this row
    NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	// Instantiate vc from the storyboard using id from datasource
    navigationController.viewControllers = @[[self.storyboard instantiateViewControllerWithIdentifier:[itemForRow valueForKey:@"id"]]];
	
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Return the height of the tableView cell
    return 46; // todo: move to a var in the header
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier  forIndexPath:indexPath];
    
	// Cell formating
	cell.backgroundColor = [UIColor clearColor];
	cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
	cell.selectedBackgroundView = [[UIView alloc] init];
	
	// Get item for this row from datasource
	NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	
	// Get icon imageview from storyboard
	UIImageView *titleImageView = (UIImageView *)[cell.contentView viewWithTag:101];
	// Get icon image from datasource
	UIImage *titleImage = [UIImage imageNamed:[itemForRow valueForKey:@"icon"]];
	// Set image to icon imageview
	[titleImageView setImage:titleImage];
	
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

