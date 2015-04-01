//
//  ViewController.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/21.
//  Copyright (c) 2014年 no. All rights reserved.
//
#import "ViewController.h"
#import "CurriculumView.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *dayOfWeekTitiesView;
@property (weak, nonatomic) IBOutlet UIView *sectionNumberView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIButton *backgroundButton;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView.contentSize = CGSizeMake(440, 860);
    
    //取消反弹效果
    self.scrollView.bounces = NO;
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if (!self.backgroundButton.hidden) {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.menuView.alpha = 0;
                             self.menuView.frame = CGRectMake(self.menuView.frame.origin.x, -140.0f, self.menuView.frame.size.width, self.menuView.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.backgroundButton.hidden = YES;
                         }];
    }
    [self addCurriculumViews];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.scrollView.delegate = nil;
}

- (void)addCurriculumViews
{
    CurriculumView *view = [[CurriculumView alloc] init];
    view.isSingleCUrriculum = NO;
    view.sectionNumebr = 2;
    view.title = @"马克思主义哲学原理";
    view.address = @"西教二101";
    [view drawWithPoisition:CGPointMake(20 + 60*1, 20 + 60*2)];
    [self.contentView addSubview:view];
    
    CurriculumView *view1 = [[CurriculumView alloc] init];
    view1.isSingleCUrriculum = YES;
    view1.sectionNumebr = 2;
    view1.title = @"高等数学";
    view1.address = @"综合楼201";
    [view1 drawWithPoisition:CGPointMake(20 + 60*0, 20 + 60*0)];
    [self.contentView addSubview:view1];
    
    CurriculumView *view2 = [[CurriculumView alloc] init];
    view2.isSingleCUrriculum = YES;
    view2.sectionNumebr = 2;
    view2.title = @"信号与系统";
    view2.address = @"综合楼204";
    [view2 drawWithPoisition:CGPointMake(20 + 60*2, 20 + 60*2)];
    [self.contentView addSubview:view2];
    
    CurriculumView *view3 = [[CurriculumView alloc] init];
    view3.isSingleCUrriculum = YES;
    view3.sectionNumebr = 4;
    view3.title = @"计算机基础";
    view3.address = @"综合楼1104";
    [view3 drawWithPoisition:CGPointMake(20 + 60*3, 20 + 60*2)];
    [self.contentView addSubview:view3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.sectionNumberView.frame = CGRectMake(self.sectionNumberView.frame.origin.x, -scrollView.contentOffset.y + 20, self.sectionNumberView.frame.size.width, self.sectionNumberView.frame.size.height);
    self.dayOfWeekTitiesView.frame = CGRectMake(-scrollView.contentOffset.x + 20, self.dayOfWeekTitiesView.frame.origin.y, self.dayOfWeekTitiesView.frame.size.width, self.dayOfWeekTitiesView.frame.size.height);
    
    if (scrollView.contentOffset.y <= -74)
    {
        CGPoint offset = scrollView.contentOffset;
        offset.y = -74;
        scrollView.contentOffset = offset;
    }
    
    if (scrollView.contentOffset.x <= -5)
    {
        CGPoint offset = scrollView.contentOffset;
        offset.x = -5;
        scrollView.contentOffset = offset;
    }
    
}
- (IBAction)onMoreButtonClicked:(id)sender {
    [self switchPickerViewStatus];
}
- (void)switchPickerViewStatus
{
    if (self.backgroundButton.hidden) {
        self.backgroundButton.hidden = NO;
        [UIView animateWithDuration:0.2 animations:^{
            self.menuView.alpha = 0.9;
            self.menuView.frame = CGRectMake(self.menuView.frame.origin.x, 64.0f, self.menuView.frame.size.width, self.menuView.frame.size.height);
        }];
    } else {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.menuView.alpha = 0;
                             self.menuView.frame = CGRectMake(self.menuView.frame.origin.x, -140.0f, self.menuView.frame.size.width, self.menuView.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.backgroundButton.hidden = YES;
                         }];
    }
}
- (IBAction)onBackgroundButtonClcked:(id)sender {
    [self switchPickerViewStatus];
}

@end
