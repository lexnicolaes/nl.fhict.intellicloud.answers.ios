//
//  LanguageDefinition.h
//  Answers
//
//  Created by Lex Nicolaes on 09-12-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Model for representing a language, e.g. 'Dutch' or 'English'.
 * Note: this could be replaced with NSLocale
 */
@interface LanguageDefinition : NSObject

/**
 * @property languageID
 * @brief Gets or sets the unique identifier of the language definition.
 */
@property (nonatomic, assign) NSInteger languageID;

/**
 * @property name
 * @brief Gets or sets the name of the language as it is called in English, e.g. 'Dutch', 'German' or 'English'.
 */
@property (nonatomic, strong) NSString * name;

/**
 * @property languageCode
 * @brief Gets or sets the ISO_639-1 compliant language code for the Language
 */
@property (nonatomic, strong) NSString * languageCode;

/**
 * Initialized a LanguageDefinition with attributes from a (JSON) dictionary.
 * @param [NSDicationary] attributes to be parsed
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
