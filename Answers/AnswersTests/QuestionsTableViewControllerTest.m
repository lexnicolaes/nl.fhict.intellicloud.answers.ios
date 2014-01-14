//
//  QuestionsTableViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "QuestionsTableViewController.h"

@interface QuestionsTableViewControllerTest : XCTestCase

@end

/**
 * @brief QuestionsTableViewController for all tests
 */
QuestionsTableViewController* vc;

@implementation QuestionsTableViewControllerTest

/**
 * @brief Set up for all tests on the QuestionsTableViewController class
 */
- (void)setUp
{
    vc = [[QuestionsTableViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the QuestionsTableViewController class
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
    XCTAssertNotNil(vc, @"Can't initialize QuestionsTableViewController.");
}

/*
 * TODO:
 * Test all methods from the QuestionsTableViewController class.
 */

@end
