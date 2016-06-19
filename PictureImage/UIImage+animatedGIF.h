//
//  UIImage+animatedGIF.h
//  PictureImage
//
//  Created by 蒋永昌 on 6/16/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>


@interface UIImage (animatedGIF)

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;


+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;


+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;



@end
