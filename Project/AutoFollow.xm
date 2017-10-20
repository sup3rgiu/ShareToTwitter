
//Add into Frameworks in your Makefile: Accounts Social

#import <Accounts/Accounts.h>
#import <Social/Social.h>

- (void)followMe {
	ACAccountStore *accountStore = [[ACAccountStore alloc] init];
	ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
	[accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
		if(granted) {
			// Get the list of Twitter accounts.
			NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];

			// We are assuming there is only one Twitter account present.
			// If there is more than one Twitter account present, you can ask the user which account they want to tweet from
			if ([accountsArray count] > 0) {
				// Grab the initial Twitter account to tweet from.
				ACAccount *twitterAccount = [accountsArray objectAtIndex:0];

				NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
				[tempDict setValue:@"@username" forKey:@"screen_name"]; //put your Twitter username instead of @username
				[tempDict setValue:@"true" forKey:@"follow"];
				//NSLog(@"*******tempDict %@*******",tempDict);

				//requestForServiceType

				SLRequest *postRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:[NSURL URLWithString:@"https://api.twitter.com/1/friendships/create.json"] parameters:tempDict];
				[postRequest setAccount:twitterAccount];
				[postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
					NSString *output = [NSString stringWithFormat:@"HTTP response status: %li Error %ld", (long)[urlResponse statusCode],(long)error.code];
					NSLog(@"%@error %@", output,error.description);
				}];
			}

		}
	}];
}