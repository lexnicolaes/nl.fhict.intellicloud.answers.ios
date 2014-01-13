//
//  MenuViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MenuViewController.h"

@interface MenuViewControllerTest : XCTestCase

@end

/**
 * @brief MenuViewController for all tests
 */
MenuViewController* vc;

@implementation MenuViewControllerTest

/**
 * @brief Set up for all tests on the MenuViewController class
 */
- (void)setUp
{
    vc = [[MenuViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the MenuViewController class
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
    XCTAssertNotNil(vc, @"Can't initialize MenuViewController.");
}

/*
 * TODO:
 * Test all methods from the MenuViewController class.
 */

@end
