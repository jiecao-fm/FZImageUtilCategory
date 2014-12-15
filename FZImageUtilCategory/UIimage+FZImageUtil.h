//
//  FZImageUtilCategory.h
//  FZImageUtilCategory
//
//  Created by 周俊 on 14/12/15.
//  Copyright (c) 2014年 shannon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (FZImageUtil)

/**
 Sacle image by width. Protect the original aspect ratio.
 */
+ (UIImage *)scaleImage:(UIImage *)image byWidth:(CGFloat )width;

/**
 Use a rectangle to crop image.
 */
+ (UIImage *)cropImage:(UIImage *)image rect:(CGRect)rect;

/**
 Generate thumbnail for image. Respect "size" width means that:
 1.Make thumbnail not bigger than "size" by cropping or scaling.
 2.Making thumbnail fill the "size" width takes precedence.
 */
+ (UIImage *)thumbnailOfImage:(UIImage *)image respectWidthOfSize:(CGSize)size;

@end
