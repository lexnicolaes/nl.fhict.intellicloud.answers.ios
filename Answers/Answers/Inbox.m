//
//  Inbox.m
//  Answers
//
//  Created by Lex Nicolaes on 05-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "Inbox.h"

@implementation Inbox

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
        q.questionState = arc4random() * 4;
        q.content = [questions objectAtIndex:idx];
        
        [data addObject:q];
    }];
    
    //convert object to data
    /*NSData* jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
        //print out the data contents
        jsonSummary.text = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    */
    
    //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    //NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    
    
    return data;
}

@end
