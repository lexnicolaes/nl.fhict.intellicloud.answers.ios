//
//  PersistentStoreManager.m
//  Answers
//
//  Created by Joris Vervuurt on 09-01-14.
//  Copyright (c) 2014 IntelliCloud. All rights reserved.
//

#import "PersistentStoreManager.h"

#import "PersistentStoreData.h"

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
        
        // Load all data available locally
        [_sharedClient loadData];
	});
    
    return _sharedClient;
}

/**
 * @brief Method for loading all data available locally
 * @return Boolean value indicating if the data was loaded successfully
 */
- (BOOL)loadData
{
    // Variable that contains a boolean value indicating if the data was loaded successfully
    BOOL success = NO;
    
    // Create the path
    NSString *persistentStoreDataFilePath = [PersistentStoreDataFilePath stringByExpandingTildeInPath];
    
    // Attempt to load the persistent store data
    @try
    {
        self.persistentStoreData = [NSKeyedUnarchiver unarchiveObjectWithFile:persistentStoreDataFilePath];
        success = YES;
    }
    @catch (NSException *exception)
    {
        success = NO;
    }
    
    // Log the result
    NSLog(@"PersistentStoreManager: %@", (success ? @"PersistentStoreData loaded successfully." : @"failed to load PersistentStoreData."));
    
    // Return the result
    return success;
}

/**
 * @brief Method for saving all data locally
 * @return Boolean value indicating if the data was saved successfully
 */
- (BOOL)saveData
{
    // Create the path and attempt to save the persistent store data
    NSString *persistentStoreDataFilePath = [PersistentStoreDataFilePath stringByExpandingTildeInPath];
    BOOL success = [NSKeyedArchiver archiveRootObject:self.persistentStoreData toFile:persistentStoreDataFilePath];
    
    // Log the result
    NSLog(@"PersistentStoreManager: %@", (success ? @"PersistentStoreData saved successfully." : @"failed to save PersistentStoreData."));
    
    // Return the result
    return success;
}

@end