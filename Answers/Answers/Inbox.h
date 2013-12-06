//
//  Inbox.h
//  Answers
//
//  Created by Lex Nicolaes on 05-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "User.h"

@interface Inbox : NSObject

+ (NSMutableArray *)_fillArrayWithDummyData;
+ (NSMutableArray *)getDummyData;

@end
