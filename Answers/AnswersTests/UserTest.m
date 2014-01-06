//
//  UserTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "User.h"

@interface UserTest : XCTestCase

@end

/**
 * @brief User object for initialization without attributes test.
 */
User* emptyUser;

@implementation UserTest

/**
 * @brief Set up for all tests on the User class
 */
- (void)setUp
{
    emptyUser = [[User alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the User class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptyUser is initialized
 */
- (void)testIfEmptyUserIsInitialized
{
    XCTAssertNotNil(emptyUser, @"Can't initialize a empty User.");
}

@end
