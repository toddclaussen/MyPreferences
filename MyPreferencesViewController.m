//
//  MyPreferencesViewController.m
//  MyPreferences
//
//  Created by Todd Claussen on 3/31/14.
//  Copyright (c) 2014 Todd Claussen. All rights reserved.
//

#import "MyPreferencesViewController.h"

@interface MyPreferencesViewController ()

@end

@implementation MyPreferencesViewController

NSMutableArray *colors;
NSString *favoriteColorSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}


- (void)viewDidLoad {
    //---create an array containing the colors values---
    colors = [[NSMutableArray alloc] init];
    [colors addObject:@"Red"];
    [colors addObject:@"Green"];
    [colors addObject:@"Blue"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)dismissKeyboard {
    // add textfields and textviews
    // [Nameofoutletlikeatextfield resignFirstResponder];
    [self.loginName resignFirstResponder];
    [self.password resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadSettings:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginName.text = [defaults objectForKey:@"login_name"];
    self.password.text = [defaults objectForKey:@"password"];
    
    //---find the index of the array for the color saved---
    favoriteColorSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"color"]];
    int selIndex = [colors indexOfObject:favoriteColorSelected];
    
    //---display the saved color in the Picker view---
    [self.favoriteColor selectRow:selIndex inComponent:0 animated:YES];

}

- (IBAction)saveSettings:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.loginName.text forKey:@"login_name"];
    [defaults setObject:self.password.text forKey:@"password"];
    [defaults setObject:favoriteColorSelected forKey:@"color"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];

}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [colors count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [colors objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    favoriteColorSelected = [colors objectAtIndex:row];
}
@end
