//
//  MainTabBarController.m
//  Answers
//
//  Created by Lex Nicolaes on 25-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

/**
 * TabBar for initial view.
 * Sets localization for tabs on app load.
 */
@implementation MainTabBarController

/**
 * @brief Set localization on VC load
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Localization for the tab titles
    [[self.viewControllers objectAtIndex:0] setTitle:NSLocalizedString(@"Questions", nil)];
    [[self.viewControllers objectAtIndex:1] setTitle:NSLocalizedString(@"Reviews", nil)];
}

@end
