//
//  UIColor+Theme.m
//  SkillExchange
//
//  Created by 余畅 on 14-8-7.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "UIColor+Theme.h"

@implementation UIColor (theme)

+ (UIColor *)themeColor
{
    return [UIColor colorWithHexString:@"#71b7ff"];
}

+ (UIColor *)themeSecondaryColor
{
    return [UIColor colorWithHexString:@"#47a2ff"];
}

+ (UIColor *)backgroundColor
{
    return [UIColor colorWithHexString:@"#f5f5f5"];
}

+ (UIColor *)subscriptColor
{
    return [UIColor colorWithHexString:@"#f26868"];
}

+ (UIColor *)textColorOfTitle;
{
    return [UIColor colorWithHexString:@"#282828"];
}

+ (UIColor *)textColorOfDiscoverLabel
{
    return [UIColor colorWithHexString:@"#24a6dc"];
}

+ (UIColor *)textColorOfContent
{
    return [UIColor colorWithHexString:@"#7c818b"];
}

+ (UIColor *)textColorOfAnnotate
{
    return [UIColor colorWithHexString:@"#cbced7"];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6)
        return [UIColor whiteColor];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];//去掉头
    if ([cString length] != 6)
        return [UIColor whiteColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
