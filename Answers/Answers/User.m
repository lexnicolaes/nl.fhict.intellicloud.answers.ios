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
    if (!self)
    {
        return nil;
    }
    
    // Disabled, we get null pointers when using mock data
    //self.userID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.username= [attributes valueForKey:@"Username"];
    self.password = [attributes valueForKey:@"Password"];
    self.firstname = [attributes valueForKey:@"FirstName"];
    self.infix = [attributes valueForKey:@"Infix"];
    self.lastname = [attributes valueForKey:@"LastName"];
    // Disabled, we get null pointers when using mock data
    //self.type = [[attributes valueForKey:@"Type"] integerValue];
    // todo: parse array for sources (holds Source objects)
    // todo: parse datetime for creationtime (check formatting)
    // todo: parse array for keywords
    
    return self;
}

@end
