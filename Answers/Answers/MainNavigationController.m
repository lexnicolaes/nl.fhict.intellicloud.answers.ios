//
//  MainViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

/**
 * ViewController for holding a TableView child
 * This VC handles most styling of it and it's subviews.
 */
@implementation MainNavigationController

/**
 * @brief Set styling for VC on load
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    // NavigationBar accesory color (buttons, spinners, etc...)
    self.navigationBar.tintColor = [UIColor navigationTintColor];
    
    // NavigationBar background color
    self.navigationBar.barTintColor = [UIColor navigationBarTintColor];
    
    // NavigationBar label text color
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor navigationLabelTextColor]}];
    
    // TabBar tint color
    self.tabBarController.tabBar.tintColor = [UIColor tabBarTintColor];
}

@end
