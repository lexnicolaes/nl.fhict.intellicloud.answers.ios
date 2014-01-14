//
//  AboutTableViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AboutTableViewController.h"

@interface AboutTableViewControllerTest : XCTestCase

@end

/**
 * @brief AboutTableViewController for all tests
 */
AboutTableViewController* vc;

@implementation AboutTableViewControllerTest

/**
 * @brief Set up for all tests on the AcknowledgementViewController class
 */
- (void)setUp
{
    vc = [[AboutTableViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the AcknowledgementViewController class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief test if vc is initialized
 */
- (void)testInitialization
{
    XCTAssertNotNil(vc, @"Can't initialize AboutTableViewController.");
}

/*
 * TODO:
 * Test all methods from the AboutTableViewController class.
 */

@end
