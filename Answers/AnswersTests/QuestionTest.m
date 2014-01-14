//
//  QuestionTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Question.h"

@interface QuestionTest : XCTestCase

@end

/**
 * @brief Question object for initialization without attributes test.
 */
Question* emptyQuestion;

@implementation QuestionTest

/**
 * @brief Set up for all tests on the Question class
 */
- (void)setUp
{
    emptyQuestion = [[Question alloc] initWithAttributes:nil];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the Question class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if emptyQuestion is initialized
 */
- (void)testIfEmptyQuestionIsInitialized
{
    XCTAssertNotNil(emptyQuestion, @"Can't initialize a empty Question");
}

/**
 * @brief Test if get emptyQuestion.languageDefinition is nil.
 */
- (void)testGetFromEmptyQuestion
{
    XCTAssertNil(emptyQuestion.languageDefinition, @"emptyQuestion.languageDefinition is not nil.");
}

/**
 * @brief Test set emptyQuestion.languageDefinition.
 */
- (void)testSetFromEmptyQuestion
{
    emptyQuestion.languageDefinition = [[LanguageDefinition alloc] initWithAttributes:nil];
    
    XCTAssertNotNil(emptyQuestion.languageDefinition, @"emptyQuestion.languageDefinition is nil.");
}

/*  TODO:
 *      + (NSURLSessionDataTask *)getQuestionsWithBlock:(void (^)(NSArray *questions, NSError *error))block
 */

@end
