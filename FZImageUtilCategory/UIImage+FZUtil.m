//
//  FZImageUtilCategory.m
//  FZImageUtilCategory
//
//  Created by 周俊 on 14/12/15.
//  Copyright (c) 2014年 shannon. All rights reserved.
//

#import "UIImage+FZUtil.h"

@implementation UIImage (FZUtil)

- (UIImage *)imageByScaleToWidth:(CGFloat )width {
    float newHeight = self.size.height / self.size.width * width;
    //clean the last blank line
    newHeight = (int)(newHeight * self.scale) / self.scale;
    UIGraphicsBeginImageContextWithOptions((CGSize){width, newHeight}, false, self.scale);
    [self drawInRect:CGRectMake(0, 0, width, newHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByScaleToHeight:(CGFloat)height {
    float newWidth = self.size.width / self.size.height * height;
    //clean the last blank line
    newWidth = (int)(newWidth * self.scale) / self.scale;
    UIGraphicsBeginImageContextWithOptions((CGSize){newWidth, height}, false, self.scale);
    [self drawInRect:CGRectMake(0, 0, newWidth, height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)imageByCropWithRect:(CGRect)rect {
    //clean the last blank line
    rect.size.height = (int)(rect.size.height * self.scale) / self.scale;
    rect.size.width = (int)(rect.size.width * self.scale) / self.scale;
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
        image = self;
    }
    
    //crop the image height
    if (image.size.height > size.height) {
        image = [image imageByCropWithRect:(CGRect){0, 0, size.width, size.height}];
    }
    return image;
}

- (UIImage *)thumbnailOfMaxSize:(CGSize)maxSize {
    //who is taller
    float maxRatio = maxSize.height / maxSize.width;
    float selfRatio = self.size.height / self.size.width;
    
    UIImage *image;

    //self is taller
    if (selfRatio > maxRatio) {
        //scale to the same width
        if (self.size.width > maxSize.width) {
            image = [self imageByScaleToWidth:maxSize.width];
        } else {
            maxSize.height = self.size.width / maxSize.width * maxSize.height;
            maxSize.width = self.size.width;
            image = self;
        }
    } else {
        //scale to the same height
        if (self.size.height > maxSize.height) {
            image = [self imageByScaleToHeight:maxSize.height];
        } else {
            maxSize.width = self.size.height / maxSize.height * maxSize.width;
            maxSize.height = self.size.height;
            image = self;
        }
    }
    
    //crop center
    image = [image imageByCropWithRect:(CGRect){(image.size.width - maxSize.width) / 2, (image.size.height - maxSize.height) / 2, maxSize.width, maxSize.height}];
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
