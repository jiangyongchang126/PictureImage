//
//  UIViewController+Loading.m
//  PictureImage
//
//  Created by 蒋永昌 on 6/16/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import "UIViewController+Loading.h"
#import "UIImage+animatedGIF.h"
#import <objc/runtime.h>

const char *loadingViewKey = "loadingViewKey";

@interface UIViewController ()

@property (nonatomic, strong)UIImageView* loadingView;

@end

@implementation UIViewController (Loading)

- (UIImageView*)loadingView{
    UIImageView* view = objc_getAssociatedObject(self, &loadingViewKey);
    if (!view) {
        view = [[UIImageView alloc]initWithImage:[UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kuColorLoading" ofType:@"gif"]]]];
        [view sizeToFit];
        view.center = self.view.center;
        self.loadingView = view;
    }
    return view;
}

- (void)setLoadingView:(UIImageView *)loadingView{
    objc_setAssociatedObject(self, &loadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showLoading{
    [self.view addSubview:self.loadingView];
}

- (void)hideLoading{
    [self.loadingView removeFromSuperview];
}

@end
