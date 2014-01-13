//
//  PersistentStoreData.h
//  Answers
//
//  Created by Joris Vervuurt on 09-01-14.
//  Copyright (c) 2014 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Wrapper class that contains the data managed by the persistent store
 */
@interface PersistentStoreData : NSObject <NSCoding>

@property (nonatomic, strong) NSArray *questions;

@end
