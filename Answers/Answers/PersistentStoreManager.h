//
//  PersistentStoreManager.h
//  Answers
//
//  Created by Joris Vervuurt on 09-01-14.
//  Copyright (c) 2014 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * File path of the persistent store
 */
static NSString * const PersistentStoreFilePath = @"~/Documents/PersistentStore";

/**
 * Class for managing the persistent store
 */
@interface PersistentStoreManager : NSObject

/**
 * @brief Get singleton instance of PersistentStore
 */
+ (instancetype)sharedClient;

/**
 * @brief Method for saving all data locally
 */
- (BOOL)saveLocally;

@end