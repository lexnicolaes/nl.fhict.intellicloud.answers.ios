//
//  NSDate+Dotnet.h
//  Answers
//
//  Created by Lex Nicolaes on 09-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Dotnet)

/**
 * Get NSDate from .NET formatted date object
 * From: http://simianzombie.com/posts/2012/11/06/yet-another-ios-json-date-parser
 * @param [NSString] .NET date string to be parsed
 */
+ (NSDate *)dateFromDotnetDate:(NSString *)dateString;

/**
 * Get .NET formatted date object from NSDate
 * From: http://simianzombie.com/posts/2012/11/06/yet-another-ios-json-date-parser
 * @param [NSDate] Date to be converted to .net date string
 */
+ (NSString *)dotnetDateFromDate:(NSDate *)date;

@end
