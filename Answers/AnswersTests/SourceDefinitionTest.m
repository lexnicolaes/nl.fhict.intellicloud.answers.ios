//
//  SourceDefinitionTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SourceDefinition.h"

@interface SourceDefinitionTest : XCTestCase

@end

/**
 * @brief SourceDefinition object for initialization without attributes test.
 */
SourceDefinition* emptySourceDefinition;

@implementation SourceDefinitionTest

/**
 * @brief Set up for all tests on the SourceDefinition class
 */
- (void)setUp
{
    emptySourceDefinition = [[SourceDefinition alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the SourceDefinition class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptySourceDefinition is initialized
 */
- (void)testIfEmptySourceDefinitionIsInitialized
{
    XCTAssertNotNil(emptySourceDefinition, @"Can't initialize a empty SourceDefinition.");
}

@end
