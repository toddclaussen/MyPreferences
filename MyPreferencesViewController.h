//
//  MyPreferencesViewController.h
//  MyPreferences
//
//  Created by Todd Claussen on 3/31/14.
//  Copyright (c) 2014 Todd Claussen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPreferencesViewController : UIViewController
- (IBAction)loadSettings:(id)sender;
- (IBAction)saveSettings:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *loginName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIPickerView *favoriteColor;

@end
