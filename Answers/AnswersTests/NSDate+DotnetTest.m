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
    
    //Initialize date to 00:18:33 16 December 2013.
    date = [dateFormatter dateFromString:@"33-18-00-16-Dec-2013"];
    
    //Initialize dateString to 00:18:33 16 December 2013.
    dateString = @"/Date(1387145913778+0100)/";
    
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
- (void)testIfDateStringIsInitialized
{
    XCTAssertNotNil(dateString, @"dateString is nil.");
}

/**
 * @brief Tests + (NSDate *)dateFromDotnetDate:(NSString *)dateString
 */
- (void)testDateFromDotnetDate
{
    NSDate* leDate = [NSDate dateFromDotnetDate:dateString];
    
    XCTAssertEqualWithAccuracy([leDate timeIntervalSinceDate:date], 0, 1, @"dateFromDotnetDate failed.");
}

/**
 * @brief Tests + (NSString *)dotnetDateFromDate:(NSDate *)date
 */
- (void)testDotnetDateFromDate
{
    NSString* leDateString = [NSDate dotnetDateFromDate:date];
    
    NSArray* arrayDateString1 = [dateString componentsSeparatedByString:@"("];
    NSArray* arrayleDateString1 = [leDateString componentsSeparatedByString:@"("];
    
    NSArray* arrayDateString2 = [[arrayDateString1 objectAtIndex:1] componentsSeparatedByString:@"+"];
    NSArray* arrayleDateString2 = [[arrayleDateString1 objectAtIndex:1] componentsSeparatedByString:@")"];
    
    NSString* dateS1 = [[NSString alloc] initWithString:[arrayDateString2 objectAtIndex:0]];
    NSString* dateS2 = [[NSString alloc] initWithString:[arrayleDateString2 objectAtIndex:0]];
    
    long long date1 = [dateS1 longLongValue];
    long long date2 = [dateS2 longLongValue];
    
    XCTAssertEqualWithAccuracy(date1, date2, 100000000000, @"dotnetDateFromDate failed.");
    //TODO: fix
}

@end
