//
//  SourceDefinition.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "SourceDefinition.h"

@implementation SourceDefinition

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    //self.userID = [[attributes valueForKeyPath:@"Id"] integerValue];
    //self.username = [attributes valueForKey:@"Username"];
    
    return self;
}

@end
