//
//  PersistentStoreManager.m
//  Answers
//
//  Created by Joris Vervuurt on 09-01-14.
//  Copyright (c) 2014 IntelliCloud. All rights reserved.
//

#import "PersistentStoreManager.h"

/**
 * Class for managing the persistent store
 */
@implementation PersistentStoreManager

/**
 * @brief Method for getting a singleton instance of class PersistentStore
 */
+ (instancetype)sharedClient
{
    static PersistentStoreManager *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedClient = [[PersistentStoreManager alloc] init];
	});
    
    return _sharedClient;
}

/**
 * @brief Method for saving all data locally
 */
- (BOOL)saveLocally
{
    NSString *persistentStorePath = [PersistentStoreFilePath stringByExpandingTildeInPath];
    BOOL success = [NSKeyedArchiver archiveRootObject:self toFile:persistentStorePath];
    
    return success;
}

@end