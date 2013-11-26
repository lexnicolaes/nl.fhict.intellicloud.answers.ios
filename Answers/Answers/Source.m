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
    if (!self)
    {
        return nil;
    }
    
    //todo: implement parsing
    
    return self;
}

@end
