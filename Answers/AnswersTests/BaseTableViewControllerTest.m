//
//  BaseTableViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "BaseTableViewController.h"

@interface BaseTableViewControllerTest : XCTestCase

@end

/**
 * @brief BaseTableViewController for all tests
 */
BaseTableViewController* vc;

@implementation BaseTableViewControllerTest

/**
 * @brief Set up for all tests on the BaseTableViewController class
 */
- (void)setUp
{
    vc = [[BaseTableViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the BaseTableViewController class
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
    XCTAssertNotNil(vc, @"Can't initialize BaseTableViewController.");
}

/*
 * TODO:
 * Test all methods from the BaseTableViewController class.
 */

@end
