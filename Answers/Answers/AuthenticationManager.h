//
//  GoogleAcces.h
//  Answers
//
//  Created by Erik Reusken on 05/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GTMOAuth2ViewControllerTouch.h"

#import "MainNavigationController.h"
#import "Question.h"

static NSString *const kKeychainItemName = @"IntelliCloud OAuth2 Google Plus";

static NSString *const kMyClientID = @"918910489517-v6j5fmrvi60sn3pog8dvejvsdm9rr7p7.apps.googleusercontent.com";
static NSString *const kMyClientSecret = @"RgK9Kx23RitsfPEJVwA-Nhkh";

static NSString *const kMyClientScope = @"openid profile email";

static NSString *const kShouldSaveInKeychainKey = @"shouldSaveInKeychain";

@interface AuthenticationManager : NSObject

/**
 * @property lastVC
 * @brief Save the vc to push the google login to it.
 */
@property (nonatomic, strong) UIViewController* lastVC;

/**
 * @property auth
 * @brief Save the google auth2 object.
 */
@property (nonatomic, strong) GTMOAuth2Authentication* auth;

/**
 * @brief Get singleton instance of AuthenticationManager
 */
+ (instancetype)sharedClient;

/**
 * @brief Push a google login view over vc
 */
- (void) pushGoogleLoginViewControllerTo:(UIViewController*) vc;

/**
 * @brief Sign out from google
 */
- (void)signOut;

/**
 * @brief check if signed in
 */
- (BOOL)isSignedIn;

/**
 * @brief check if autenticated
 */
- (BOOL) checkAutentication;

@end
