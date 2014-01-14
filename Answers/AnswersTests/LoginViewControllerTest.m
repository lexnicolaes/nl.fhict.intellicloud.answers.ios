//
//  LoginViewControllerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "LoginViewController.h"

@interface LoginViewControllerTest : XCTestCase

@end

/**
 * @brief LoginViewController for all tests
 */
LoginViewController* vc;

@implementation LoginViewControllerTest

/**
 * @brief Set up for all tests on the LoginViewController class
 */
- (void)setUp
{
    vc = [[LoginViewController alloc] init];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the LoginViewController class
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
    XCTAssertNotNil(vc, @"Can't initialize LoginViewController.");
}

/*
 * TODO:
 * Test all methods from the LoginViewController class.
 */

@end
