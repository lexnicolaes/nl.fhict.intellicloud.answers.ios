//
//  SourceTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Source.h"

@interface SourceTest : XCTestCase

@end

/**
 * @brief Source object for initialization without attributes test.
 */
Source* emptySource;

@implementation SourceTest

/**
 * @brief Set up for all tests on the Source class
 */
- (void)setUp
{
    emptySource = [[Source alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the Source class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptySource is initialized
 */
- (void)testIfEmptySourceIsInitialized
{
    XCTAssertNotNil(emptySource, @"Can't initialize a empty Source.");
}

@end
