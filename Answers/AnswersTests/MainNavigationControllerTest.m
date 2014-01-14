//
//  MainNavigationControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MainNavigationController.h"

@interface MainNavigationControllerTest : XCTestCase

@end

/**
 * @brief MainNavigationController for all tests
 */
MainNavigationController* vc;

@implementation MainNavigationControllerTest

/**
 * @brief Set up for all tests on the MainNavigationController class
 */
- (void)setUp
{
    vc = [[MainNavigationController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the MainNavigationController class
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
    XCTAssertNotNil(vc, @"Can't initialize MainNavigationController.");
}

/*
 * TODO:
 * Test all methods from the MainNavigationController class.
 */

@end
