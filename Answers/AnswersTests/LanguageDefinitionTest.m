//
//  LanguageDefinitionTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "LanguageDefinition.h"

@interface LanguageDefinitionTest : XCTestCase

@end

/**
 * @brief LanguageDefinition object for initialization without attributes test.
 */
LanguageDefinition* emptyLanguageDefinition;

@implementation LanguageDefinitionTest

/**
 * @brief Set up for all tests on the LanguageDefinition class
 */
- (void)setUp
{
    emptyLanguageDefinition = [[LanguageDefinition alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the LanguageDefinition class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptyLanguageDefinition is initialized
 */
- (void)testIfEmptyLanguageDefinitionIsInitialized
{
    XCTAssertNotNil(emptyLanguageDefinition, @"Can't initialize a empty LanguageDefinition.");
}

@end
