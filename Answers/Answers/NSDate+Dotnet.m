//
//  NSDate+Dotnet.m
//  Answers
//
//  Created by Lex Nicolaes on 09-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "NSDate+Dotnet.h"

@implementation NSDate (Dotnet)

/**
 * Get NSDate from .NET formatted date object
 * From: http://simianzombie.com/posts/2012/11/06/yet-another-ios-json-date-parser
 * @param [NSString] .NET date string to be parsed
 */
+ (NSDate *)dateFromDotnetDate:(NSString *)dateString
{
    if (dateString == nil) return nil;
    
    // Extract the numeric part of the date.  Dates should be in the format
    // "/Date(x)/", where x is a number.  This format is supplied automatically
    // by JSON serialisers in .NET.  Alternatively, dates can be supplied with
    // the time zone suffixed after x as a 5 character timezone offset,
    // consisting of a positive/negative indicator ('+' or '-'), two digit hour
    // offset, and two digit minute offset (ie. '-0700' for MST).
    NSRange range = NSMakeRange(6, [dateString length] - 8);
    NSString* substring = [dateString substringWithRange:range];
    
    NSTimeInterval seconds;
    
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    
    // We need to parse out the date portion and the timezone portion
    // separately.  It's possible that we won't have a timezone and the date is
    // negative, so we have to be more specific when searching for the
    // separator.
    unichar timezoneSeparator = [substring characterAtIndex:substring.length - 5];
    
    NSString *date = nil;
    
    if (timezoneSeparator == '+' || timezoneSeparator == '-')
    {
        date = [substring substringToIndex:substring.length - 5];
        
        NSString *timeZone = [substring substringFromIndex:substring.length - 4];
        NSString *timeZoneHours = [timeZone substringToIndex:2];
        NSString *timeZoneMinutes = [timeZone substringFromIndex:2];
        
        NSNumber* milliseconds = [formatter numberFromString:date];
        
        int hours = [[formatter numberFromString:timeZoneHours] intValue];
        int minutes = [[formatter numberFromString:timeZoneMinutes] intValue];
        int offset = (minutes + (hours * 60)) * 60;
        
        // NSTimeInterval is specified in seconds, with milliseconds as
        // fractions.  The value we get back from the web service is specified
        // in milliseconds.  Both values are since 1st Jan 1970 (epoch).
        seconds = [milliseconds longLongValue] / 1000.0;
        
        if (timezoneSeparator == '+')
        {
            seconds += offset;
        }
        else
        {
            seconds -= offset;
        }
    }
    else
    {
        date = substring;
        
        NSNumber* milliseconds = [formatter numberFromString:date];
        seconds = [milliseconds longLongValue] / 1000.0;
    }
    
    // If we've encountered .NET's minimum date value we treat it as nil.
    if ([date isEqualToString:@"-59011459200000"]) return nil;
    
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

/**
 * Get .NET formatted date object from NSDate
 * From: http://simianzombie.com/posts/2012/11/06/yet-another-ios-json-date-parser
 * @param [NSDate] Date to be converted to .net date string
 */
+ (NSString *)dotnetDateFromDate:(NSDate *)date
{
    if (date == nil) return NULL;
    
    NSString *value = [NSNumberFormatter localizedStringFromNumber:[NSNumber numberWithDouble:date.timeIntervalSince1970 * 1000] numberStyle:NSNumberFormatterNoStyle];
    
    return [NSString stringWithFormat:@"/Date(%@)/", value];
}

@end
