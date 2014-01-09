//
//  PersistentStoreData.m
//  Answers
//
//  Created by Joris Vervuurt on 09-01-14.
//  Copyright (c) 2014 IntelliCloud. All rights reserved.
//

#import "PersistentStoreData.h"

/**
 * Wrapper class that contains the data managed by the persistent store
 */
@implementation PersistentStoreData

/**
 * @brief Constructor that sets all properties to default values (only used by PersistentStoreManager).
 */
- (id)init
{
    if (self == [super init])
    {
        self.questions = [NSArray array];
    }
    
    return self;
}

/**
 * @brief NSCoding interface method for initializing an instance of this class.
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    // Instantiate a new object and decode the values using the decoder
    if (self == [super init])
    {
        self.questions = [aDecoder decodeObjectForKey:@"Questions"];
    }
    
    // Return the instantiated object
    return self;
}

/**
 * @brief NSCoding interface method for encoding the current instance of this class.
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.questions forKey:@"Questions"];
}

@end
