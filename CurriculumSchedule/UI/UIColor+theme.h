//
//  UIColor+Theme.h
//  SkillExchange
//
//  Created by 余畅 on 14-8-7.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (theme)

+ (UIColor *)themeColor;
+ (UIColor *)themeSecondaryColor;
+ (UIColor *)backgroundColor;
+ (UIColor *)subscriptColor;
+ (UIColor *)textColorOfTitle;
+ (UIColor *)textColorOfDiscoverLabel;
+ (UIColor *)textColorOfContent;
+ (UIColor *)textColorOfAnnotate;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
