//
//  UIImage+SQImage.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/16.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "UIImage+SQImage.h"

@implementation UIImage (SQImage)
+(UIImage *)loadImage:(NSString *)imageName{
    if ([UIDevice currentDevice].systemVersion.floatValue>7.0) {
        
        UIImage *image=[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        return image;
    }
    UIImage *image=[UIImage imageNamed:imageName];
    
    
    return image;
    
}
@end
