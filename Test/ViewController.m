//
//  ViewController.m
//  Test
//
//  Created by AJ on 9/12/14.
//  Copyright (c) 2014 AJ. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import <float.h>

/// phat.letan@2359media.com.vn

@interface ViewController ()

@end

@implementation ViewController

@synthesize lblMessage, datePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    lblMessage.text = [self diffFromDate:[NSDate date] toDate:datePicker.date];
//    [self diffHoursAboutStringFromDate:[NSDate date] toDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark NSDate
- (NSString*)diffFromDate:(NSDate*)fromDate toDate:(NSDate*)toDate{
    int second = (int)[toDate timeIntervalSinceDate:fromDate];
    NSString *result = @"past";
    if (second>0) {
        NSDictionary *dic = @{@"less than a minute":@(LessThanAMinute), @"about a minute":@(AboutAMinute), [NSString stringWithFormat:@"about %d minutes", (int)(second/60 + 1)]:@(AboutMinutes), @"about an hour":@(AboutAnHour), [NSString stringWithFormat:@"about %d hours", (int)(second/3600 + 1)]:@(AboutHours), @"about a day":@(AboutADay), [NSString stringWithFormat:@"about %d days", (int)(second/86400 + 1)]:@(AboutDays)};
        
        //// If have month and year, just add into: dic
        
        result = [dic.allKeys firstObject];
        float value = FLT_MAX;
        for (id key in dic) {
            if (value>=[[dic objectForKey:key] floatValue] && [[dic objectForKey:key] floatValue]*60>second) {
                value = [[dic objectForKey:key] floatValue];
                result = key;
            }
        }
        if (value==FLT_MAX) {
            return @"unknown";
        }
    }
    return result;
}



- (NSString*)diffHoursAboutStringFromDate:(NSDate*)fromDate toDate:(NSDate*)toDate{
    int second = (int)[toDate timeIntervalSinceDate:fromDate];
    if (second>=0) {
        if (second<=60*LessThanAMinute) {
            return @"less than a minute";
        }
        if (second<=60*AboutAMinute) {
            return @"about a minute";
        }
        if (second<=60*AboutMinutes) {
            return [NSString stringWithFormat:@"about %d minutes", (int)(second/60 + 1)];
        }
        if (second<=60*AboutAnHour) {
            return @"about an hour";
        }
        if (second<=60*AboutHours) {
            return [NSString stringWithFormat:@"about %d hours", (int)(second/3600 + 1)];
        }
        if (second<=60*AboutADay) {
            return @"about a day";
        }
        if (second<=60*AboutDays) {
            return [NSString stringWithFormat:@"about %d days", (int)(second/86400 + 1)];
        }
    }else{
        return @"past";
    }
    return @"unknown";
}
- (IBAction)datePickerValueChanged:(id)sender{
        lblMessage.text = [self diffFromDate:[NSDate date] toDate:datePicker.date];
}
@end
