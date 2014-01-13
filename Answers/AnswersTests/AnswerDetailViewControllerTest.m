//
//  AnswerDetailViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AnswerDetailViewController.h"

@interface AnswerDetailViewControllerTest : XCTestCase

@end

/**
 * @brief AnswerDetailViewController for all tests
 */
AnswerDetailViewController* vc;

@implementation AnswerDetailViewControllerTest

/**
 * @brief Set up for all tests on the AnswerDetailViewController class
 */
- (void)setUp
{
    vc = [[AnswerDetailViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the AnswerDetailViewController class
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
    XCTAssertNotNil(vc, @"Can't initialize AnswerDetailViewController.");
}

/*
 * TODO:
 * Test all methods from the AnswerDetailViewController class.
 */

@end
