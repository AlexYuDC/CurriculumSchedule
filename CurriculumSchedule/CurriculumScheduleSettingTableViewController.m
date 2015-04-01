//
//  CurriculumScheduleSettingTableViewController.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/27.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "CurriculumScheduleSettingTableViewController.h"
#import <KeyboardManager/KeyboardManager.h>

@interface CurriculumScheduleSettingTableViewController ()

@property (nonatomic, strong) UIView *inputView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation CurriculumScheduleSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.textField = [[UITextField alloc] init];
    self.datePicker = [[UIDatePicker alloc] init];
    self.textField.inputView = self.datePicker;
    
    
    self.inputView = [[UIView alloc] init];
    [self.inputView addSubview:self.textField];
    [self.view addSubview:self.inputView];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.textField becomeFirstResponder];
    NSLog(@"%ld", (long)indexPath.row);
}

@end