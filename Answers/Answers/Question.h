//
//  Question.h
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "SourceDefinition.h"
#import "LanguageDefinition.h"
#import "NSDate+Dotnet.h"
#import "WebserviceManager.h"

/**
 * An enumeration indicating the state of a Question.
 */
typedef NS_ENUM(NSInteger, QuestionState)
{
    QuestionStateOpen,           /**< Indicates the Question is received. */
    QuestionStateUpForAnswer,    /**< Indicates the Question is assigned to an employee to be asnwered. */
    QuestionStateUpForFeedback,  /**< Indicates the Answer for the Question is send but it isn't confirmed if it was accepted. */
    QuestionStateClosed          /**< Indicates the Question is answered and the answer is accepted. */
};

/**
 * Model for representing a Question retreived from the Webservice
 */
@interface Question : NSObject <NSCoding>

/**
 * @property questionID
 * @brief Gets the unique identifier of the question.
 */
@property (nonatomic, assign) NSInteger questionID;

/**
 * @property content
 * @brief Gets the content of the question. The content contains question asked by the User.
 */
@property (nonatomic, strong) NSString * content;

/**
 * @property languageDefinition
 * @brief Gets or sets the language the answer is written in.
 */
@property (nonatomic, strong) LanguageDefinition * languageDefinition;

/**
 * @property questionUser
 * @brief Gets the user that aksed the question.
 */
@property (nonatomic, strong) User * questionUser;

/**
 * @property answerUser
 * @brief Gets the user that is going to answer the question.
 */
@property (nonatomic, strong) User * answerUser;

/**
 * @property questionState
 * @brief Gets the state of the question.
 */
@property (nonatomic, assign) QuestionState questionState;

/**
 * @property sourceType
 * @brief Gets the type of source that is used to return the answer to the question.
 * The actual source can be found using the Question.User field.
 */
@property (nonatomic, strong) SourceDefinition *sourceType;

/**
 * @property creayionTime
 * @brief Gets the creation date and time of the question.
 */
@property (nonatomic, strong) NSDate *creationTime;

/**
 * Initialized a User with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

/**
 * Initialized a User with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 * @param attributes to be parsed
 */
+ (NSURLSessionDataTask *)getQuestionsWithBlock:(void (^)(NSArray *questions, NSError *error))block;

@end
