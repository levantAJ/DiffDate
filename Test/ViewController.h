//
//  ViewController.h
//  Test
//
//  Created by AJ on 9/12/14.
//  Copyright (c) 2014 AJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


- (IBAction)datePickerValueChanged:(id)sender;
@end
