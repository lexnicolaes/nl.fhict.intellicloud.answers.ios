//
//  Source.m
//  Answers
//
//  Created by Lex Nicolaes on 24-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "Source.h"

/**
 * Model representing a Source retreived from the Webservice
 */
@implementation Source

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
    
    self.sourceID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.sourceDefinition = [[SourceDefinition alloc] initWithAttributes:[attributes valueForKey:@"SourceDefinition"]];
    self.value = [attributes valueForKey:@"Value"];
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
