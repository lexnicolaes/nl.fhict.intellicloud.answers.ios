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
