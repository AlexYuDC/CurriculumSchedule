//
//  Curriculum.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/21.
//  Copyright (c) 2014年 no. All rights reserved.
//

#define MAX_TIME_NUMBER 18

#import "Curriculum.h"

@implementation Curriculum

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"";
        self.teacherName = @"";
        self.classroom = @"";
    }
    
    return self;
}

- (BOOL)addTime:(CurriculumTime *)time
{
    if (_timeArray.count > MAX_TIME_NUMBER) {
        return NO;
    }
    
    [_timeArray addObject:time];
    return YES;
}

- (BOOL)isMatch:(Curriculum *)curriculum
{
    if (self.title == curriculum.title &&
        self.teacherName == curriculum.teacherName &&
        self.classroom == curriculum.classroom &&
        [self.timeArray isEqualToArray:curriculum.timeArray])
    {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isMatchOneInArray:(NSArray *)aArray
{
    for (id obj in aArray) {
        if ([obj isKindOfClass:[Curriculum class]]) {
            Curriculum *curriculum = obj;
            if (self.title == curriculum.title &&
                self.teacherName == curriculum.teacherName &&
                self.classroom == curriculum.classroom &&
                [self.timeArray isEqualToArray:curriculum.timeArray])
            {
                return YES;
            }
        }
    }
    
        return NO;
}

@end

////////////////////////////////////////////////////////////
@implementation CurriculumTime

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.weekAvalableArray = [[NSMutableArray alloc] initWithCapacity:14];
        self.dayOfWeek = 1;
        self.startSection = 1;
        self.numberOfSections = 1;
    }
    
    return self;
}

- (NSInteger)numberOfSections
{
    return _startSection - _endSection + 1;
}

- (void)setValueWithweekAvalableArray:(NSArray *)weekAvalableArray dayOfWeek:(NSInteger)dayOfWeek startOfSection:(NSInteger)startOfSection endOfSection:(NSInteger)endOfSction
{
    self.weekAvalableArray = [[NSMutableArray alloc] initWithArray:weekAvalableArray];
    self.dayOfWeek = dayOfWeek;
    self.startSection = startOfSection;
    self.endSection = endOfSction;
}

@end
