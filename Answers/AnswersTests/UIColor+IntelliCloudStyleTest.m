//
//  UIColor+IntelliCloudStyleTest.m
//  Answers
//
//  Created by Erik Reusken on 17/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UIColor_IntelliCloudStyleTest : XCTestCase

@end

/**
 * @brief UIColor for navigationBarTintColor
 */
UIColor* navigationBarTintColor;

/**
 * @brief UIColor for navigationTintColor
 */
UIColor* navigationTintColor;

/**
 * @brief UIColor for navigationLabelTextColor
 */
UIColor* navigationLabelTextColor;

/**
 * @brief UIColor for tabBarTintColor
 */
UIColor* tabBarTintColor;

/**
 * @brief UIColor for tableTintColor
 */
UIColor* tableTintColor;

/**
 * @brief UIColor for buttonLabelTextColor
 */
UIColor* buttonLabelTextColor;

@implementation UIColor_IntelliCloudStyleTest

/**
 * @brief Set up for all tests on the UIColor+IntelliCloudStyle class
 */
- (void)setUp
{
    //Get color for navigationBarTintColor
    navigationBarTintColor = [UIColor navigationBarTintColor];
    
    //Get color for navigationTintColor
    navigationTintColor = [UIColor navigationTintColor];
    
    //Get color for navigationLabelTextColor
    navigationLabelTextColor = [UIColor navigationLabelTextColor];
    
    //Get color for tabBarTintColor
    tabBarTintColor = [UIColor tabBarTintColor];
    
    //Get color for tableTintColor
    tableTintColor = [UIColor tableTintColor];
    
    //Get color for buttonLabelTextColor
    buttonLabelTextColor = [UIColor buttonLabelTextColor];
    
    [super setUp];
}

/**
 * @brief Tear down for all tests on the UIColor+IntelliCloudStyle class
 */
- (void)tearDown
{
    [super tearDown];
}

/**
 * @brief Test if navigationBarTintColor is initialized
 */
- (void)testIfNavigationBarTintColorIsInitialized
{
    XCTAssertNotNil(navigationBarTintColor, @"navigationBarTintColor is nil.");
}

/**
 * @brief Test if navigationTintColor is initialized
 */
- (void)testIfNavigationTintColorIsInitialized
{
    XCTAssertNotNil(navigationTintColor, @"navigationTintColor is nil.");
}

/**
 * @brief Test if navigationLabelTextColor is initialized
 */
- (void)testIfNavigationLabelTextColorIsInitialized
{
    XCTAssertNotNil(navigationLabelTextColor, @"navigationLabelTextColor is nil.");
}

/**
 * @brief Test if tabBarTintColor is initialized
 */
- (void)testIfTabBarTintColorIsInitialized
{
    XCTAssertNotNil(tabBarTintColor, @"tabBarTintColor is nil.");
}

/**
 * @brief Test if tableTintColor is initialized
 */
- (void)testIfTableTintColorIsInitialized
{
    XCTAssertNotNil(tableTintColor, @"tableTintColor is nil.");
}

/**
 * @brief Test if buttonLabelTextColor is initialized
 */
- (void)testIfButtonLabelTextColorIsInitialized
{
    XCTAssertNotNil(buttonLabelTextColor, @"buttonLabelTextColor is nil.");
}

@end
