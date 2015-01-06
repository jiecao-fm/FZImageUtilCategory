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
 Sacle image by height. Protect the original aspect ratio.
 */
- (UIImage *)imageByScaleToHeight:(CGFloat)height;

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
 Generate thumbnail for image. Not bigger than the maxSize. 
 For example, if maxSize is 60*60, original size is 800*600. We scale it to 80*60, then crop a 60*60 image from it's center.
 */
- (UIImage *)thumbnailOfMaxSize:(CGSize)maxSize;

/**
 Generate an image with single color.
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
