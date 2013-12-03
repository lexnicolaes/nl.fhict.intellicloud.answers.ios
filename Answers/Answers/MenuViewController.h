//
//  MenuViewController.h
//  Answers
//
//  Created by Lex Nicolaes on 02-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RESideMenu/RESideMenu.h>

@interface MenuViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property (nonatomic, retain) NSArray *menuItems;

@end
