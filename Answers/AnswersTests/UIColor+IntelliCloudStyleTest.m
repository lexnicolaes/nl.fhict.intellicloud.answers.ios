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

@implementation UIColor_IntelliCloudStyleTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testExample
{
    UIColor* navigationBarTintColor = [UIColor navigationBarTintColor];
    UIColor* navigationTintColor = [UIColor navigationTintColor];
    UIColor* navigationLabelTextColor = [UIColor navigationLabelTextColor];
    
    UIColor* tabBarTintColor = [UIColor tabBarTintColor];
    
    UIColor* tableTintColor = [UIColor tableTintColor];
    
    UIColor* buttonLabelTextColor = [UIColor buttonLabelTextColor];
    
    XCTAssertNotNil(navigationBarTintColor, @"navigationBarTintColor is nil.");
    XCTAssertNotNil(navigationTintColor, @"navigationTintColor is nil.");
    XCTAssertNotNil(navigationLabelTextColor, @"navigationLabelTextColor is nil.");
    
    XCTAssertNotNil(tabBarTintColor, @"tabBarTintColor is nil.");
    
    XCTAssertNotNil(tableTintColor, @"tableTintColor is nil.");
    
    XCTAssertNotNil(buttonLabelTextColor, @"buttonLabelTextColor is nil.");
}

@end
