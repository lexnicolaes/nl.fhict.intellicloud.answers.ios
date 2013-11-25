//
//  WebserviceManager.h
//  Answers
//
//  Created by Lex Nicolaes on 21-11-13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

/**
 * Base URL for the webservice, used by the networking class
 */
static NSString * const WebserviceManagerBaseURLString = @"http://81.204.121.229/IntelliCloudService/IntelliCloud.svc/";

@interface WebserviceManager : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
