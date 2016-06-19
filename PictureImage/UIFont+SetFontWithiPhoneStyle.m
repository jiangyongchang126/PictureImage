//
//  UIFont+SetFontWithiPhoneStyle.m
//  PictureImage
//
//  Created by 蒋永昌 on 6/16/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import "UIFont+SetFontWithiPhoneStyle.h"

//判断是否 Phone 4/5/6 是否是iPad
#define Phone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define Phone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define Phone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define Phone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)



@implementation UIFont (SetFontWithiPhoneStyle)

+(UIFont *)updateUIFontWithSize:(CGFloat)fontSize{
    
    if (Phone4) {
        
        return [UIFont systemFontOfSize:0.85*fontSize];
        
    }else if (Phone5){
        
        return [UIFont systemFontOfSize:0.85*fontSize];

    }else if (Phone6){
        
        return [UIFont systemFontOfSize:fontSize];

    }else if (Phone6Plus){
        
        return [UIFont systemFontOfSize:1.2*fontSize];

    }else if (isPad){
        
        return [UIFont systemFontOfSize:2*fontSize];

    }
    
    return [UIFont boldSystemFontOfSize:0.85*fontSize];
}



@end
