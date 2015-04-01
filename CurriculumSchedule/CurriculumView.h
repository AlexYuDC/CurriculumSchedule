//
//  CurriculumView.h
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/24.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurriculumView : UIView

@property BOOL isSingleCUrriculum;
@property NSInteger sectionNumebr;
@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,strong) NSString *address;

- (void)drawWithPoisition:(CGPoint)point;

@end
