//
//  CurriculumView.m
//  CurriculumSchedule
//
//  Created by 余畅 on 14/10/24.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "CurriculumView.h"
#import "UITools.h"

CGFloat cornerRadius            = 4;
CGFloat crankToBounds           = 4;
CGFloat crankToRect             = 4;
CGFloat distanceOfRects         = 3;
CGFloat squareWidth             = 60;
CGFloat fontSize                = 11;
NSString *frontRectColorString  = @"69c2df";
NSString *backRectcolorString   = @"55aac6";

@implementation CurriculumView

- (void)drawWithPoisition:(CGPoint)point
{
    self.frame = CGRectMake(point.x, point.y, squareWidth, squareWidth * _sectionNumebr);
    self.backgroundColor = [UIColor clearColor];
    
    CGRect singleRectFrame = CGRectMake(crankToBounds,
                                        crankToBounds,
                                        squareWidth - 2*crankToBounds,
                                        _sectionNumebr * squareWidth - 2*crankToBounds);
    
    CGRect frontRectFrame  = CGRectMake(crankToBounds,
                                        crankToBounds,
                                        squareWidth - 2*crankToBounds - distanceOfRects,
                                        _sectionNumebr * squareWidth - 2*crankToBounds - distanceOfRects);
    
    CGRect backRectFrame   = CGRectMake(crankToBounds + distanceOfRects,
                                        crankToBounds + distanceOfRects,
                                        squareWidth - 2 * crankToBounds - distanceOfRects,
                                        _sectionNumebr * squareWidth - 2*crankToBounds - distanceOfRects);
    
    CGRect labelFrame      = CGRectMake(crankToBounds + crankToRect + (_isSingleCUrriculum ? 0 : distanceOfRects),
                                        crankToBounds + crankToRect + (_isSingleCUrriculum ? 0 : distanceOfRects),
                                        squareWidth - 2 * (crankToBounds + crankToRect) - (_isSingleCUrriculum ? 0 : distanceOfRects),
                                        _sectionNumebr * squareWidth - 2 * (crankToBounds + crankToRect) - (_isSingleCUrriculum ? 0 : distanceOfRects));
    
    if (_isSingleCUrriculum) {
        UIView *singleRectView = [[UIView alloc] initWithFrame:singleRectFrame];
        singleRectView.backgroundColor = [UIColor colorWithHexString:frontRectColorString];
        singleRectView.layer.cornerRadius = cornerRadius;
        [self addSubview:singleRectView];
    } else {
        UIView *backRectView = [[UIView alloc] initWithFrame:frontRectFrame];
        backRectView.backgroundColor = [UIColor colorWithHexString:backRectcolorString];
        backRectView.layer.cornerRadius = cornerRadius;
        [self addSubview:backRectView];
        
        UIView *frontRectView = [[UIView alloc] initWithFrame:backRectFrame];
        frontRectView.backgroundColor = [UIColor colorWithHexString:frontRectColorString];
        frontRectView.layer.cornerRadius = cornerRadius;
        [self addSubview:frontRectView];
    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:labelFrame];
    titleLabel.text = [NSString stringWithFormat:@"%@\n%@", _title, _address];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:fontSize];
    titleLabel.numberOfLines = 0;
    [self addSubview:titleLabel];
}


@end
