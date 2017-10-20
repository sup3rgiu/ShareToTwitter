#import <Preferences/Preferences.h>
#import <UIKit/UIActivityViewController.h>
#import <Twitter/TWTweetComposeViewController.h>
#import <Twitter/Twitter.h>
#import <UIKit/UIKit.h>

@interface YourSettingsListController: PSListController {
}
@end

@implementation YourSettingsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"YourSettings" target:self] retain];
	}
	return _specifiers;
}

- (void)loadView {
    [super loadView];
	 UIImage *heartImage = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/YourSettings.bundle/heart.png"];
	 UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] 
                    initWithImage:heartImage
                            style:UIBarButtonItemStylePlain 
                           target:self 
                           action:@selector(shareToTwitter:)];
                            
    self.navigationItem.rightBarButtonItem = rightButton;
}


- (void)shareToTwitter:(id)sender {
    TWTweetComposeViewController *tweetController = [[TWTweetComposeViewController alloc] init];
    [tweetController setInitialText:@"This is a an awesome message"];
    [tweetController addImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/YourSettings.bundle/heart.png"]];
    [self.navigationController presentViewController:tweetController animated:YES completion:nil];
    [tweetController release];
}

@end

// vim:ft=objc
