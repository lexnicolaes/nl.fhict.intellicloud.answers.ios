//
//  LanguageDefinition.m
//  Answers
//
//  Created by Lex Nicolaes on 09-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "LanguageDefinition.h"

@implementation LanguageDefinition

/**
 * Initialized a LanguageDefinition with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self || [attributes isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    
    self.languageID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.name = [attributes valueForKey:@"Name"];
    self.languageCode = [NSLocale canonicalLocaleIdentifierFromString:_name];
    
    return self;
}

/**
 * @brief NSCoding interface method for initializing an instance of this class.
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    // Instantiate a new object and decode the values using the decoder
    if (self == [super init])
    {
        self.languageID = [aDecoder decodeIntegerForKey:@"Id"];
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.languageCode = [aDecoder decodeObjectForKey:@"LanguageCode"];
    }
    
    // Return the instantiated object
    return self;
}

/**
 * @brief NSCoding interface method for encoding the current instance of this class.
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // Encode the values using the coder
    [aCoder encodeInteger:self.languageID forKey:@"Id"];
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.languageCode forKey:@"LanguageCode"];
}

@end
