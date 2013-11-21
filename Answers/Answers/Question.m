//
//  Question.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    
    self.questionID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.content = [attributes valueForKey:@"Content"];
    // todo: parse inner object User for questionUser
    // todo: parse inner object User for questionUser
    self.questionState = [[attributes valueForKey:@"QuestionState"] integerValue];
    // todo: parse inner object SourceDefinition for sourceType
    
    return self;
}

@end
