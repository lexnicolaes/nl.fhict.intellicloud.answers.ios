//
//  SourceDefinition.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "SourceDefinition.h"

/**
 * Model representing a SourceDefinition retreived from the Webservice
 * A SourceDefinition defines a Source. A Source can be a account for some service,
 * like facebook, twitter or email.
 */
@implementation SourceDefinition

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
    
    self.sourceDefinitionID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.name = [attributes valueForKey:@"Name"];
    self.description = [attributes valueForKey:@"Description"];
    self.creationTime = [NSDate dateFromDotnetDate:[attributes valueForKey:@"CreationTime"]];
    
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
        self.sourceDefinitionID = [aDecoder decodeIntegerForKey:@"Id"];
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.description = [aDecoder decodeObjectForKey:@"Description"];
        self.creationTime = [aDecoder decodeObjectForKey:@"CreationTime"];
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
    [aCoder encodeInteger:self.sourceDefinitionID forKey:@"Id"];
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.description forKey:@"Description"];
    [aCoder encodeObject:self.creationTime forKey:@"CreationTime"];
}

@end
