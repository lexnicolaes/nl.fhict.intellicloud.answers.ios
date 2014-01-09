//
//  User.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "User.h"

/**
 * Model representing a User retreived from the Webservice
 */
@implementation User

/**
 * Initialized a User with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self || [attributes isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    
    self.userID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.username = [attributes valueForKey:@"Username"];
    self.password = [attributes valueForKey:@"Password"];
    self.firstname = ![[attributes valueForKey:@"FirstName"] isKindOfClass:[NSNull class]] ? [attributes valueForKey:@"FirstName"] : nil;
    self.infix = ![[attributes valueForKey:@"Infix"] isKindOfClass:[NSNull class]] ? [attributes valueForKey:@"Infix"] : nil;
    self.lastname = ![[attributes valueForKey:@"LastName"] isKindOfClass:[NSNull class]] ? [attributes valueForKey:@"LastName"] : nil;
    NSMutableArray *tempSources = [[NSMutableArray alloc] init];
    for (NSDictionary *attr in [attributes valueForKey:@"Sources"])
    {
        Source *leSource = [[Source alloc] initWithAttributes:attr];
        [tempSources addObject:leSource];
    }
    self.sources = [tempSources copy];
    self.type = [[attributes valueForKey:@"Type"] integerValue];
    self.creationTime = [NSDate dateFromDotnetDate:[attributes valueForKey:@"CreationTime"]];
    
    return self;
}

/**
 * @brief NSCoding interface method for initializing an instance of this class.
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self == [super init])
    {
        // TODO: decode values using the decoder
    }
    
    return self;
}

/**
 * @brief NSCoding interface method for encoding the current instance of this class.
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // TODO: encode values using the coder
}

@end
