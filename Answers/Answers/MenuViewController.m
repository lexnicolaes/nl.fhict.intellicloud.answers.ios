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
                       @{@"title": @"Inbox", @"icon": @"reviewIcon", @"id": @"inboxViewController"},
                       @{@"title": @"Open", @"icon": @"reviewIcon", @"id": @"openViewController"},
                       @{@"title": @"Rejected", @"icon": @"reviewIcon", @"id": @"rejectedViewController"},
                       @{@"title": @"Pending", @"icon": @"reviewIcon", @"id": @"pendingViewController"},
                       @{@"title": @"In review", @"icon": @"reviewIcon", @"id": @"reviewViewController"}],
                   @[
                       @{@"title": @"Support", @"icon": @"reviewIcon", @"id": @"supportViewController"},
                       @{@"title": @"About", @"icon": @"reviewIcon", @"id": @"aboutViewController"}],
                   @[
                       @{@"title": @"Sign out", @"icon": @"reviewIcon", @"id": @"inboxViewController"}]];
    
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.sideMenuViewController.contentViewController;
    
    NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    navigationController.viewControllers = @[[self.storyboard instantiateViewControllerWithIdentifier:[itemForRow valueForKey:@"id"]]];
    [self.sideMenuViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_menuItems count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return [[_menuItems objectAtIndex:sectionIndex] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"LeCell ";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSDictionary *itemForRow = [[_menuItems objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = [itemForRow valueForKey:@"title"];
    cell.imageView.image = [UIImage imageNamed:[itemForRow valueForKey:@"icon"]];
    
    return cell;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end

