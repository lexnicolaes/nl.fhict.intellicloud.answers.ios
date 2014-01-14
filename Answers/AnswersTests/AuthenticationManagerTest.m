//
//  AuthenticationManagerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AuthenticationManager.h"

@interface AuthenticationManagerTest : XCTestCase

@end

/**
 * @brief AuthenticationManager for all tests
 */
AuthenticationManager* manager;

@implementation AuthenticationManagerTest

/**
 * @brief Set up for all tests on the AuthenticationManager class
 */
- (void)setUp
{
    manager = [AuthenticationManager sharedClient];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the AuthenticationManager class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief test if manager is initialized
 */
- (void)testInitialization
{
    XCTAssertNotNil(manager, @"AuthenticationManager is nil.");
}

/*
 * TODO:
 * Test all methods from the AuthenticationManager class.
 */

@end
