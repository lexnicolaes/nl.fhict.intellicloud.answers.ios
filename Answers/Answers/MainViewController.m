//
//  MainViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // NavigationBar accesory color (buttons, spinners, etc...)
    self.navigationBar.tintColor = [UIColor navigationTintColor];
    
    // NavigationBar background color
    self.navigationBar.barTintColor = [UIColor navigationBarTintColor];
    self.navigationBar.translucent = NO;
    
    // NavigationBar label text color
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor navigationLabelTextColor]}];
    
    // TabBar tint color
    self.tabBarController.tabBar.tintColor = [UIColor tabBarTintColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
