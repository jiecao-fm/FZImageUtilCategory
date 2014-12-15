//
//  FZImageUtilCategory.m
//  FZImageUtilCategory
//
//  Created by 周俊 on 14/12/15.
//  Copyright (c) 2014年 shannon. All rights reserved.
//

#import "UIImage+FZImageUtil.h"

@implementation UIImage (FZImageUtil)

- (UIImage *)imageByScaleToWidth:(CGFloat )width {
    float newHeight = self.size.height / self.size.width * width;
    UIGraphicsBeginImageContextWithOptions((CGSize){width, newHeight}, false, self.scale);
    [self drawInRect:CGRectMake(0, 0, width, newHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByCropWithRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale);
    [self drawAtPoint:CGPointMake(-rect.origin.x, -rect.origin.y)];
    UIImage *cropped_image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cropped_image;
}

- (UIImage *)thumbnailRespectWidthOfSize:(CGSize)size {
    UIImage *image;
    //scale to the same width
    if (self.size.width > size.width) {
        image = [self imageByScaleToWidth:size.width];
    } else {
        size.height = self.size.width / size.width * size.height;
        size.width = self.size.width;
    }
    
    //crop the image height
    if (image.size.height > size.height) {
        image = [self imageByCropWithRect:(CGRect){0, 0, size.width, size.height}];
    }
    return image;
}

@end
