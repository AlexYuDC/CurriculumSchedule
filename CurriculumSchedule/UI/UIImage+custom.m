//
//  UIImage+custom.m
//  SkillExchange
//
//  Created by 余畅 on 14-8-26.
//  Copyright (c) 2014年 no. All rights reserved.
//

#import "UIImage+custom.h"

@implementation UIImage (custom)

+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)maskImage
{
    
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef maskedImageRef = CGImageCreateWithMask([image CGImage], mask);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];
    
    // returns new image with mask applied
    return maskedImage;
}

+ (UIImage *)maskImageWithRoundMask:(UIImage *)image
{
    UIImage *maskImage = [UIImage imageNamed:@"assit_roundMask_120"];
    UIImage *maskedImage = [UIImage maskImage:image withMask:maskImage];
    return maskedImage;
}

@end
