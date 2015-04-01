//
//  UIImage+custom.h
//  SkillExchange
//
//  Created by 余畅 on 14-8-26.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (custom)

+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)maskImage;

+ (UIImage *)maskImageWithRoundMask:(UIImage *)image;

@end
