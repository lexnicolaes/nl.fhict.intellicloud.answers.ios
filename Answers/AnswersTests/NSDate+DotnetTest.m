//
//  NSDate+DotnetTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+Dotnet.h"

@interface NSDate_DotnetTest : XCTestCase

@end

/**
 * @brief NSDate
 */
NSDate* date;

/**
 * @brief NSSting
 */
NSString* dateString;

/**
 * @brief NSDateFormatter
 */
NSDateFormatter *dateFormatter;

@implementation NSDate_DotnetTest

/**
 * @brief Set up for all tests on the NSDate+DotnetTest class
 */
- (void)setUp
{
    //Initialize dateFormatter.
    dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"ss-mm-HH-dd-MMM-yyyy";
    
    //Initialize date to 0:00 1 January 2007.
    date = [dateFormatter dateFromString:@"00-00-00-01-Jan-2007"];
    
    //Initialize dateString to 0:00 1 January 2007.
    //dateString = @"/Date(1387145913778+0100)/";
    //TODO
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the NSDate+DotnetTest class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if dateFormatter is initialized
 */
- (void)testIfDateFormatterIsInitialized
{
    XCTAssertNotNil(dateFormatter, @"dateFormatter is nil.");
}

/**
 * @brief Test if date is initialized
 */
- (void)testIfDateIsInitialized
{
    XCTAssertNotNil(date, @"date is nil.");
}

/**
 * @brief Test if dateString is initialized
 */
//- (void)testIfDateStringIsInitialized
//{
//    XCTAssertNotNil(dateString, @"dateString is nil.");
//}

/**
 * @brief Tests + (NSDate *)dateFromDotnetDate:(NSString *)dateString
 */
//- (void)testDateFromDotnetDate
//{
//    NSDate* leDate = [NSDate dateFromDotnetDate:dateString];
//    
//    XCTAssertNotEqualObjects(leDate, date, @"dateFromDotnetDate failed.");
//}

/**
 * @brief Tests + (NSString *)dotnetDateFromDate:(NSDate *)date
 */
//- (void)testDotnetDateFromDate
//{
//    NSString* leDateString = [NSDate dotnetDateFromDate:date];
//    
//    XCTAssertNotEqualObjects(leDateString, dateString, @"dotnetDateFromDate failed.");
//}

@end
