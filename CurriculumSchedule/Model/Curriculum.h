//
//  Curriculum.h
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/21.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CurriculumTime;
@interface Curriculum : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *teacherName;
@property (nonatomic, strong) NSString *classroom;
@property (nonatomic, strong) NSMutableArray *timeArray;

- (BOOL)addTime:(CurriculumTime *)time;
- (BOOL)isMatch:(Curriculum *)curriculum;

@end

////////////////////////////////////////////////////////////
@interface CurriculumTime : NSObject

@property (nonatomic, strong) NSMutableArray *weekAvalableArray;
@property (nonatomic) NSInteger dayOfWeek;
@property (nonatomic) NSInteger startSection;
@property (nonatomic) NSInteger endSection;
@property (nonatomic) NSInteger numberOfSections;


- (NSInteger)numberOfSections;
- (void)setValueWithweekAvalableArray:(NSArray *)weekAvalableArray dayOfWeek:(NSInteger)dayOfWeek startOfSection:(NSInteger)startOfSection endOfSection:(NSInteger)endOfSction;

@end
