//
//  GoogleAcces.h
//  Answers
//
//  Created by Erik Reusken on 05/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTMOAuth2ViewControllerTouch.h"

#import "Question.h"

static NSString *const kKeychainItemName = @"IntelliCloud OAuth2 Google Plus";

static NSString *const kMyClientID = @"918910489517-v6j5fmrvi60sn3pog8dvejvsdm9rr7p7.apps.googleusercontent.com";
static NSString *const kMyClientSecret = @"RgK9Kx23RitsfPEJVwA-Nhkh";

static NSString *const kMyClientScope = @"openid profile email";

static NSString *const kShouldSaveInKeychainKey = @"shouldSaveInKeychain";

@interface AuthenticationManager : NSObject

@property (nonatomic, strong) UIViewController* lastVC;

@property (nonatomic, strong) GTMOAuth2Authentication* auth;

+ (instancetype)sharedClient;

- (void) pushGoogleLoginViewControllerTo:(UIViewController*) vc;
- (void)signOut;

- (BOOL)isSignedIn;
- (BOOL) checkAutentication;

@end
