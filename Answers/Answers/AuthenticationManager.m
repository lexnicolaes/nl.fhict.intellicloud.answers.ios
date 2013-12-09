//
//  GoogleAcces.m
//  Answers
//
//  Created by Erik Reusken on 05/12/13.
//  Copyright (c) 2013 IntelliCloud. All rights reserved.
//

#import "AuthenticationManager.h"

#import "MainNavigationController.h"

@implementation AuthenticationManager

/**
 * @brief Get singleton instance of AuthenticationManager
 */
+ (instancetype)sharedClient
{
	static AuthenticationManager *_sharedClient = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedClient = [[AuthenticationManager alloc] init];
	});
    
	return _sharedClient;
}

- (BOOL)isSignedIn
{
	BOOL isSignedIn = self.auth.canAuthorize;
	return isSignedIn;
}

- (BOOL) checkAutentication
{
	return [_auth canAuthorize];
}

- (void) pushGoogleLoginViewControllerTo:(UIViewController*) vc
{
	_lastVC = vc;
    
	[self signInToGoogle];
}

- (BOOL)shouldSaveInKeychain
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	BOOL flag = [defaults boolForKey:kShouldSaveInKeychainKey];
	return flag;
}

- (void)signOut
{
	if ([self.auth.serviceProvider isEqual:kGTMOAuth2ServiceProviderGoogle])
	{
		// remove the token from Google's servers
		[GTMOAuth2ViewControllerTouch revokeTokenForGoogleAuthentication:self.auth];
	}
    
	// remove the stored Google authentication from the keychain, if any
	[GTMOAuth2ViewControllerTouch removeAuthFromKeychainForName:kKeychainItemName];
    
	// Discard our retained authentication object.
	self.auth = nil;
}

- (void)signInToGoogle
{
	[self signOut];
    
	NSString *keychainItemName = nil;
	if ([self shouldSaveInKeychain])
	{
		keychainItemName = kKeychainItemName;
	}
    
	// Display the autentication view.
	SEL finishedSel = @selector(viewController:finishedWithAuth:error:);
    
	GTMOAuth2ViewControllerTouch *viewController = [GTMOAuth2ViewControllerTouch controllerWithScope:kMyClientScope
															  clientID:kMyClientID
														  clientSecret:kMyClientSecret
													  keychainItemName:kKeychainItemName
															  delegate:self
													  finishedSelector:finishedSel];
    
	// Display some html briefly before the sign-in page loads
	NSString *html = [NSString stringWithFormat:@"<html><body style=\"background-color:#ffffff;font-family:'HelveticaNeue-Light', 'Helvetica Neue Light', 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif;font-weight: 300;\"><div style=\"text-align:center;margin-top:64px;\">%@</div></body></html>", NSLocalizedString(@"Loading...", @"Text to show when login screen is loading.")];
	viewController.initialHTMLString = html;
    
	viewController.title = NSLocalizedString(@"Login with Google", nil);
    
	UINavigationController *loginNavigationController = [[MainNavigationController alloc] initWithRootViewController:viewController];
	[_lastVC presentViewController:loginNavigationController animated:YES completion:nil];
}

- (void)viewController:(GTMOAuth2ViewControllerTouch *)viewController finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error
{
	if (error != nil)
	{
		// Authentication failed
        
		NSLog(@"Authentication error: %@", error);
        
		NSData *responseData = [[error userInfo] objectForKey:@"data"];
        
		if ([responseData length] > 0)
		{
			// Log the body of the server's authentication failure response
			NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
			NSLog(@"%@", str);
		}
        
		self.auth = nil;
	}
	else
	{
		// Authentication succeeded
        
		// Save the authentication object
		self.auth = auth;
        
        [Question getQuestionsWithBlock:nil];
        
		// Dismiss view controllers
		[viewController dismissViewControllerAnimated:YES completion:^
         {
             [_lastVC dismissViewControllerAnimated:NO completion:nil];
         }];
	}
}

@end
