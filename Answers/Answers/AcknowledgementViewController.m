//
//  AcknowledgementViewController.m
//  Answers
//
//  Created by Paul Poos on 05-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "AcknowledgementViewController.h"

@interface AcknowledgementViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@end

@implementation AcknowledgementViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
	self.splitViewController.delegate = self;
	
    //Localize the title
    self.title = NSLocalizedString(@"Info", nil);
    
    // Get the acknowledgements file from Cocoapods and set the text in the view
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Pods-acknowledgements" ofType:@"markdown"];
    NSString *acknowledgements =[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
    _infoTextView.text = acknowledgements;    
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
	// Bar button item for menu
	barButtonItem.title = NSLocalizedString(@"Menu", @"Menu");
	[self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
	self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
	// Called when the view is shown again in the split view, invalidating the button and popover controller.
	[self.navigationItem setLeftBarButtonItem:nil animated:YES];
	self.masterPopoverController = nil;
}

@end
