//
//  Source.h
//  Answers
//
//  Created by Lex Nicolaes on 24-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceDefinition.h"

/**
 * Model representing the Source instance of a User retreived from the Webservice
 */
@interface Source : NSObject

/**
* @property sourceID
* @brief Gets or sets the unique indentifier of the source.
*/
@property (nonatomic, assign) NSInteger * sourceID;

/**
 * @property sourcedefinition
 * @brief Gets or sets the definition of the source for which a value is provided, e.g. email, facebook or twitter.
 */
@property (nonatomic, strong) SourceDefinition * sourcedefinition;

/**
 * @property value
 * @brief Gets or sets the value for the for the given source definition, e.g. an email address or username.
 */
@property (nonatomic, strong) NSString * value;

/**
 * @property creationtime
 * @brief Gets or sets the creation date and time of the answer.
 */
@property (nonatomic, strong) NSDate * creationtime;

/**
* Initialized a User with attributes from a (JSON) dictionary.
* @param attributes to be parsed
*/
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
