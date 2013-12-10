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

@end
