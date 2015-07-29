//
//  GWReminderViewController.m
//  HypnoNerd
//
//  Created by Will Ge on 7/28/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWReminderViewController.h"

@interface GWReminderViewController ()

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;

@end

@implementation GWReminderViewController

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
