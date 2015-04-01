//
//  CurriculumScheduleAddViewController.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/27.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "CurriculumScheduleAddViewController.h"

@interface CurriculumScheduleAddViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIScrollViewDelegate>
{
    NSString *cellIdentifierCurriculum;
    NSString *cellIdentifierAdd;
    float lastContentOffset;
    CGRect importCurriculumsButtonFrame;
}
@property (weak, nonatomic) IBOutlet UITableView *curriculumTableView;
@property (weak, nonatomic) IBOutlet UIButton *importCurriculumsButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation CurriculumScheduleAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    cellIdentifierCurriculum = @"curriculum";
    cellIdentifierAdd = @"add";
    importCurriculumsButtonFrame = self.importCurriculumsButton.frame;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.curriculumTableView.delegate = nil;
}

#pragma mark -
#pragma mark - table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierCurriculum];
    return cell;
}

#pragma mark -
#pragma mark - scroll view delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y - lastContentOffset > 1 && scrollView.contentOffset.y > -64) {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.importCurriculumsButton.frame = CGRectMake(0, importCurriculumsButtonFrame.origin.y + importCurriculumsButtonFrame.size.height, importCurriculumsButtonFrame.size.width, importCurriculumsButtonFrame.size.height);
                         }];
    } else if (scrollView.contentOffset.y - lastContentOffset < -10 || scrollView.contentOffset.y < -64)
    {
        [UIView animateWithDuration:0.2
                         animations:^{
                             self.importCurriculumsButton.frame = importCurriculumsButtonFrame;
                         }];
    }
    lastContentOffset = scrollView.contentOffset.y;
}

#pragma mark -
#pragma mark - search bar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton = NO;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *keyword = searchBar.text;
    [self.searchBar resignFirstResponder];
}



@end
