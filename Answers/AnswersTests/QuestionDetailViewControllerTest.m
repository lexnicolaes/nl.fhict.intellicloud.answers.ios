//
//  QuestionDetailViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "QuestionDetailViewController.h"

@interface QuestionDetailViewControllerTest : XCTestCase

@end

/**
 * @brief QuestionDetailViewController for all tests
 */
QuestionDetailViewController* vc;

@implementation QuestionDetailViewControllerTest

/**
 * @brief Set up for all tests on the QuestionDetailViewController class
 */
- (void)setUp
{
    vc = [[QuestionDetailViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the QuestionDetailViewController class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if vc is initialized
 */
- (void)testInitialization
{
    XCTAssertNotNil(vc, @"Can't initialize QuestionDetailViewController.");
}

/*
 * TODO:
 * Test all methods from the QuestionDetailViewController class.
 */

@end
