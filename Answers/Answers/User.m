//
//  User.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    //self.userID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.username= [attributes valueForKey:@"Username"];
    self.password = [attributes valueForKey:@"Password"];
    self.firstname = [attributes valueForKey:@"FirstName"];
    self.infix = [attributes valueForKey:@"Infix"];
    self.lastname = [attributes valueForKey:@"LastName"];
    //self.type = [[attributes valueForKey:@"Type"] integerValue];
    // todo: parse array for sources (holds Source objects)
    // todo: parse datetime for creationtime (check formatting)
    // todo: parse array for keywords
    
    return self;
}

@end
