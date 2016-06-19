//
//  ViewController.m
//  PictureImage
//
//  Created by 蒋永昌 on 6/15/16.
//  Copyright © 2016 蒋永昌. All rights reserved.
//

#import "ViewController.h"
#import "SvIncrementallyImage.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import <UIImage+GIF.h>
#import "UIViewController+Loading.h"
#import "UIFont+SetFontWithiPhoneStyle.h"
#import "JYCImageIOP.h"
#import "SVProgressHUD.h"


@interface ViewController ()
{
    
    UIImageView *_imageV;
    SvIncrementallyImage *_webImage;

}


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    [SVProgressHUD showWithStatus:@"正在加载中..."];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setRingRadius:20];
    
    [SVProgressHUD dismiss];
    
    
    _imageV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageV.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    _imageV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_imageV];
//
//
//    [_imageV sd_setImageWithURL:[NSURL URLWithString:@"http://b.zol-img.com.cn/desk/bizhi/image/1/1920x1200/1348810232493.jpg"]];
    
    
    // 提示菊花GIF
//    [self showLoading];
    
    
    
    UILabel *label = [[UILabel alloc]init];
    
    label.frame = CGRectMake(30, self.view.frame.size.height - 200, self.view.frame.size.width-60, 100);
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:label];
    
    label.font = [UIFont updateUIFontWithSize:17];
    
    label.text = @"了深刻的法律可是对方拉克丝地方洒落的开发杀了快递费拉开收到了罚款as；离开对方阿斯兰地方卡死了快递费阿卡丽";
//
    UILabel *label2 = [[UILabel alloc]init];
    
    label2.frame = CGRectMake(30, self.view.frame.size.height - 100, self.view.frame.size.width-60, 50);
    label2.numberOfLines = 0;
    label2.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:label2];
    
    label2.font = [UIFont systemFontOfSize:17];
    
    label2.text = @"正常字体";
    

    
//    
//    + (MB_INSTANCETYPE)HUDForView:(UIView *)view {
//        NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
//        for (UIView *subview in subviewsEnum) {
//            if ([subview isKindOfClass:self]) {
//                return (MBProgressHUD *)subview;
//            }
//        }
//        return nil;
//    }
    
    
    NSEnumerator *subViewsEnum = [self.view.subviews reverseObjectEnumerator];
    
    for (UIView *subview in subViewsEnum) {
        
        if ([subview isEqual:label2]) {
            
            ((UILabel *)subview).text = @"正常哈哈哈哈";
        }
    }
    
    
    for (UIView *subview in self.view.subviews) {
        
        if ([subview isEqual:label]) {
            
            ((UILabel *)subview).text = @"阿斯利康的法律上扩大非收到了罚款撒地方";
        }
    }
    
    NSArray *array = @[@"one",@"two",@"three"];
    
    for (NSString *str in array) {
        
        NSLog(@"str:%@",str);
    }
    
    for (NSString *string in [array reverseObjectEnumerator]) {
        
        NSLog(@"string:%@",string);
    }
    
//

    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    
//    [self.view addSubview:btn];
//    
//    [btn sd_setImageWithURL:[NSURL URLWithString:@"http://b.zol-img.com.cn/desk/bizhi/image/1/1920x1200/1348810232493.jpg"] forState:UIControlStateNormal];
//    
//    [btn sd_setImageWithURL:[NSURL URLWithString:@"http://www.wed114.cn/jiehun/uploads/allimg/160426/39_160426110624_1.jpg"] forState:UIControlStateSelected];
//    
//    
//    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
//    [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://b.zol-img.com.cn/desk/bizhi/image/1/1920x1200/1348810232493.jpg"] forState:(UIControlStateNormal)];
//    
//    [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=4236942158,2307642402&fm=21&gp=0.jpg"] forState:UIControlStateHighlighted];
    
    
    
//    // 图片一点一点加载的感觉
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateImage) userInfo:nil repeats:YES];
//
//    NSURL *url = [[NSURL alloc] initWithString:@"http://b.zol-img.com.cn/desk/bizhi/image/1/1920x1200/1348810232493.jpg"];
//    _webImage = [[SvIncrementallyImage alloc] initWithURL:url];
//    
//    
//    _webImage.MyBlock = ^(){
//        
//        [JYCImageIOP tipMessage:@"蒋永昌hhh" afterDelay:2.0 completion:^{
//            
//            
//            
//        }];
//
//    };
    

    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)btnAction:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    NSLog(@"jjjjj");
}

- (void)updateImage
{
    _imageV.image = _webImage.image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
