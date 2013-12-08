//
//  Question.m
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "Question.h"

/**
 * Model for representing a Question retreived from the Webservice
 */
@implementation Question

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
    
    self.questionID = [[attributes valueForKeyPath:@"Id"] integerValue];
    self.content = [attributes valueForKey:@"Content"];
    self.questionUser = [[User alloc] initWithAttributes:[attributes valueForKey:@"User"]];
    self.answerUser = [[User alloc] initWithAttributes:[attributes valueForKey:@"Answerer"]];
    self.questionState = [[attributes valueForKey:@"QuestionState"] integerValue];
    self.sourceType = [[SourceDefinition alloc] initWithAttributes:[attributes valueForKey:@"SourceType"]];
    
    return self;
}

/**
 * Initialized a User with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 * @param attributes to be parsed
 */
+ (NSURLSessionDataTask *)getQuestionsWithBlock:(void (^)(NSArray *questions, NSError *error))block
{
    return [[WebserviceManager sharedClient] GET:@"QuestionService.svc/questions"
                                      parameters:nil
    success:^(NSURLSessionDataTask __unused *task, id JSON)
    {
        NSMutableArray *mutableQuestions = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON)
        {
            Question *question = [[Question alloc] initWithAttributes:attributes];
            [mutableQuestions addObject:question];
        }
        
        if (block)
        {
            block([NSArray arrayWithArray:mutableQuestions], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error)
    {
        if (block)
        {
            block([NSArray array], error);
        }
    }];
}

+ (NSMutableArray *)getDummyData
{
    static NSMutableArray *_dummyData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dummyData = [self _fillArrayWithDummyData];
    });
    
    return _dummyData;
}

// Private

+ (NSMutableArray *)_fillArrayWithDummyData
{
    NSArray *employees = @[@"Lex", @"Erik", @"Bram"];
    NSArray *people = @[@"User1", @"User2", @"User3", @"User4", @"User5"];
    NSArray *questions = @[
                           @"How do I install Windows 7?",
                           @"Am I able to use NSPredicates to filter a datasource?"
                           ];
    
    //NSLog(@"%@", [employess objectAtIndex:arc4random() * [users count]]);
    NSMutableArray *data = [NSMutableArray array];
    [questions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        User *employee = [[User alloc] init];
        employee.firstname = employees[arc4random_uniform([employees count])];
        employee.lastname = @"Employee";
        
        User *asker = [[User alloc] init];
        asker.firstname = people[arc4random_uniform([people count])];
        asker.lastname = @"Asker";
        
        Question *q = [[Question alloc] init];
        q.questionID = idx;
        q.answerUser = employee;
        q.questionUser = asker;
        q.questionState = QuestionStateOpen;//arc4random() * 4;
        q.content = [questions objectAtIndex:idx];
        
        [data addObject:q];
    }];
    
    return data;
}

@end
