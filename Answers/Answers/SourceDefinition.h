//
//  SourceDefinition.h
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+Dotnet.h"

/**
 * Model representing a SourceDefinition retreived from the Webservice
 * A SourceDefinition defines a Source. A Source can be a account for some service,
 * like facebook, twitter or email.
 */
@interface SourceDefinition : NSObject <NSCoding>

/**
* @property sourceDefinitionID
* @brief Gets or sets the unique indentifier of the source definition.
*/
@property (nonatomic, assign) NSInteger sourceDefinitionID;

/**
 * @property name
 * @brief Gets or sets the name of the source definition, e.g. 'Facebook'.
 */
@property (nonatomic, strong) NSString * name;

/**
 * @property description
 * @brief Gets or sets a description of the source definition.
 */
@property (nonatomic, strong) NSString * description;

/**
 * @property creationtime
 * @brief Gets or sets the creation date and time of source definition.
 */
@property (nonatomic, strong) NSDate * creationTime;

/**
 * Initialized a User with attributes from a (JSON) dictionary.
 * @param attributes to be parsed
 */
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
