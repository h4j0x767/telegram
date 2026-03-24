#import <UIKit/UIKit.h>

// Ultra-Minimal Hook for Testing Launch
%hook TGSettingsController

- (void)viewDidLoad {
    %orig;
    self.title = @"767 Telegram";
}

%end
