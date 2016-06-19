//
//  JYCImageIOP.h
//  PictureImage
//
//  Created by 蒋永昌 on 6/15/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
#import "MBProgressHUD.h"


@interface JYCImageIOP : NSObject

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL;



+ (void)tipMessage:(NSString *)title afterDelay:(NSTimeInterval)delay completion:(void (^)(void))completion;

@end
