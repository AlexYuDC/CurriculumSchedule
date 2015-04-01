//
//  CurriculumScheduleTodayViewController.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/24.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "CurriculumScheduleTodayViewController.h"
#import "CurriculumView.h"

NSString *cellIdentifierCurriculum = @"curriculum";
NSString *cellIdentifierTimeTitle  = @"timeTitle";
float lastContentOffset;
CGRect weekViewButtonFrame;

@interface CurriculumScheduleTodayViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *weekViewButton;

@end

@implementation CurriculumScheduleTodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    weekViewButtonFrame = self.weekViewButton.frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - table view delegate & data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 20;
    }
    if (indexPath.row == 1 || indexPath.row == 4) {
        return 50;
    } else {
        return 123;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    }
    else if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTimeTitle];
    }
    else if (indexPath.row == 4)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTimeTitle];
        UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:101];
        titleLabel.text = @"PM";
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierCurriculum];
    }

    return cell;
}

#pragma mark -
#pragma mark - scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y - lastContentOffset > 1 && scrollView.contentOffset.y > -64) {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.weekViewButton.frame = CGRectMake(0, weekViewButtonFrame.origin.y + weekViewButtonFrame.size.height, weekViewButtonFrame.size.width, weekViewButtonFrame.size.height);
                         }];
    } else if (scrollView.contentOffset.y - lastContentOffset < -10 || scrollView.contentOffset.y < -64)
    {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.weekViewButton.frame = weekViewButtonFrame;
                         }];
    }
    lastContentOffset = scrollView.contentOffset.y;
}

@end
