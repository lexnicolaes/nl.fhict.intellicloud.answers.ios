//
//  AnswerTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Answer.h"

@interface AnswerTest : XCTestCase

@end

/**
 * @brief Answer object for initialization without attributes test.
 */
Answer* emptyAnswer;

@implementation AnswerTest

/**
 * @brief Set up for all tests on the Answer class
 */
- (void)setUp
{
    emptyAnswer = [[Answer alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the Answer class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptyAnswer is initialized
 */
- (void)testIfEmptyAnswerIsInitialized
{
    XCTAssertNotNil(emptyAnswer, @"Can't initialize a empty Answer.");
}

/*  TODO:
 *      + (NSURLSessionDataTask *)postAnswerWithParameters:(NSDictionary*) parameters withBlock: (void (^)(NSError *error))block
 */

@end
