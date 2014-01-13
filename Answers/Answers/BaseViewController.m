//
//  BaseViewController.m
//  Answers
//
//  Created by Lex Nicolaes on 03-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	if(IS_IPHONE)
	{
		UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"MenuButton"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu:)];
		self.navigationItem.leftBarButtonItem = menuButton;
	}
}

- (void)showMenu:(id)sender
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
