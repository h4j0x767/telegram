#import <UIKit/UIKit.h>

@interface TGSettingsController : UIViewController
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion;
@end

%hook TGSettingsController

- (void)viewDidLoad {
    %orig;
    self.title = @"767 Telegram";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return %orig + 2; // Adding 2 sections: Features & Developer
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger totalSections = [tableView numberOfSections]; // Correct way to get sections count
    if (section == totalSections - 2) return 5; // 5 Main Mod Features
    if (section == totalSections - 1) return 1; // Hajan Salih Badge
    return %orig;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSInteger totalSections = [tableView numberOfSections];
    if (section == totalSections - 2) return @"767 MOD FEATURES";
    if (section == totalSections - 1) return @"DEVELOPER";
    return %orig;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger totalSections = [tableView numberOfSections];
    
    // Feature Section
    if (indexPath.section == totalSections - 2) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"FeatureCell"];
        NSArray *titles = @[@"Ghost Mode", @"Hide Typing", @"No Screenshot Alert", @"Save Restricted Media", @"767 Premium"];
        cell.textLabel.text = titles[indexPath.row];
        cell.textLabel.textColor = [UIColor colorWithRed:0.83 green:0.69 blue:0.22 alpha:1.0]; // Gold color
        
        UISwitch *toggle = [[UISwitch alloc] initWithFrame:CGRectZero];
        [toggle setOn:YES]; // Default ON for 767 Style
        cell.accessoryView = toggle;
        return cell;
    }
    
    // Developer Section
    if (indexPath.section == totalSections - 1) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"HajanCell"];
        cell.textLabel.text = @"Hajan Salih";
        cell.detailTextLabel.text = @"The 767 King | Developer";
        cell.detailTextLabel.textColor = [UIColor grayColor];
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(40, 40), NO, 0.0);
        [[UIColor blackColor] setFill];
        UIRectFill(CGRectMake(0, 0, 40, 40));
        cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        cell.imageView.layer.cornerRadius = 20;
        cell.imageView.clipsToBounds = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    return %orig;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger totalSections = [tableView numberOfSections];
    if (indexPath.section == totalSections - 1) {
        NSURL *url = [NSURL URLWithString:@"https://t.me/hajan767"];
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        return;
    }
    %orig;
}

%end
