//
//  JYCImageIOP.m
//  PictureImage
//
//  Created by 蒋永昌 on 6/15/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import "JYCImageIOP.h"

@implementation JYCImageIOP

/**
 *  根据图片url获取图片尺寸
 */
+ (CGSize)getImageSizeWithURL:(id)URL{
    NSURL * url = nil;
    if ([URL isKindOfClass:[NSURL class]]) {
        url = URL;
    }
    if ([URL isKindOfClass:[NSString class]]) {
        url = [NSURL URLWithString:URL];
    }
    if (!URL) {
        return CGSizeZero;  // url不正确返回CGSizeZero
    }
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0, height = 0;
    if (imageSourceRef) {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSourceRef, 0, NULL);
        if (imageProperties != NULL) {
            CFNumberRef widthNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            if (widthNumberRef != NULL) {
                CFNumberGetValue(widthNumberRef, kCFNumberFloat64Type, &width);
            }
            CFNumberRef heightNumberRef = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNumberRef != NULL) {
                CFNumberGetValue(heightNumberRef, kCFNumberFloat64Type, &height);
            }
            CFRelease(imageProperties);
        }
        CFRelease(imageSourceRef);
    }
    return CGSizeMake(width, height);
}


+ (void)tipMessage:(NSString *)title afterDelay:(NSTimeInterval)delay completion:(void (^)(void))completion
{
//    for (MBProgressHUD *hud in [MBProgressHUD allHUDsForView:[UIApplication sharedApplication].keyWindow]) {
//        
//        [hud hide:NO];
//    }
//    
//    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
//    HUD.mode = MBProgressHUDModeText;
//    HUD.removeFromSuperViewOnHide = YES;
//    HUD.detailsLabelText = title;
//    HUD.detailsLabelFont = [UIFont boldSystemFontOfSize:14];
//    HUD.userInteractionEnabled = NO;
//    [HUD hide:YES afterDelay:delay];
//    HUD.completionBlock = completion;
    for (MBProgressHUD *hud in [MBProgressHUD allHUDsForView:[UIApplication sharedApplication].keyWindow]) {
        
        [hud hide:NO];
    }
    
    MBProgressHUD * HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    UIView *aView = [UIView new];
    aView.frame = CGRectMake(0, 0, 37, 37);
    aView.backgroundColor = [UIColor redColor];
    HUD.customView = aView;
    
//    HUD.color = [UIColor cyanColor];
    
    HUD.labelText = @"😄";
    HUD.animationType = MBProgressHUDAnimationZoomIn;
    
    HUD.removeFromSuperViewOnHide = YES;
    HUD.detailsLabelText = title;
    HUD.detailsLabelFont = [UIFont boldSystemFontOfSize:14];
    HUD.userInteractionEnabled = NO;
    [HUD hide:YES afterDelay:delay];
    HUD.completionBlock = completion;

}



@end
