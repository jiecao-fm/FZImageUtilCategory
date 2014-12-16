//
//  FZImageUtilCategory.h
//  FZImageUtilCategory
//
//  Created by 周俊 on 14/12/15.
//  Copyright (c) 2014年 shannon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (FZUtil)

/**
 Sacle image by width. Protect the original aspect ratio.
 */
- (UIImage *)imageByScaleToWidth:(CGFloat )width;

/**
 Use a rectangle to crop image.
 */
- (UIImage *)imageByCropWithRect:(CGRect)rect;

/**
 Generate thumbnail for image. Respect "size" width means that:
 1.Make thumbnail not bigger than "size" by cropping or scaling.
 2.Making thumbnail fill the "size" width takes precedence.
 */
- (UIImage *)thumbnailRespectWidthOfSize:(CGSize)size;

/**
 Generate an image with single color.
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
