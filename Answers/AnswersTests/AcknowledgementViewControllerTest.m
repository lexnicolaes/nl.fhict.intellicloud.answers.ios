//
//  AcknowledgementViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AcknowledgementViewController.h"

@interface AcknowledgementViewControllerTest : XCTestCase

@end

/**
 * @brief AcknowledgementViewController for all tests
 */
AcknowledgementViewController* vc;

@implementation AcknowledgementViewControllerTest

/**
 * @brief Set up for all tests on the AcknowledgementViewController class
 */
- (void)setUp
{
    vc = [[AcknowledgementViewController alloc] init];
    
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
    XCTAssertNotNil(vc, @"Can't initialize AcknowledgementViewController.");
}

/*
 * TODO:
 * Test all methods from the AcknowledgementViewController class.
 */

@end
