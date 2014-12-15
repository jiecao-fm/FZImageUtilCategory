//
//  FZImageUtilCategory.m
//  FZImageUtilCategory
//
//  Created by 周俊 on 14/12/15.
//  Copyright (c) 2014年 shannon. All rights reserved.
//

#import "UIImage+FZImageUtil.h"

@implementation UIImage (FZImageUtil)

+ (UIImage *)scaleImage:(UIImage *)image byWidth:(CGFloat )width {
    float newHeight = image.size.height / image.size.width * width;
    UIGraphicsBeginImageContextWithOptions((CGSize){width, newHeight}, false, [image scale]);
    [image drawInRect:CGRectMake(0, 0, width, newHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)cropImage:(UIImage *)image rect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [image scale]);
    [image drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    UIImage *cropped_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cropped_image;
}

+ (UIImage *)thumbnailOfImage:(UIImage *)image respectWidthOfSize:(CGSize)size {
    //scale to the same width
    if (image.size.width > size.width) {
        image = [self scaleImage:image byWidth:size.width];
    } else {
        size.height = image.size.width / size.width * size.height;
        size.width = image.size.width;
    }
    
    //crop the image height
    if (image.size.height > size.height) {
        image = [self cropImage:image rect:(CGRect){0, 0, size.width, size.height}];
    }
    return image;
}

@end
