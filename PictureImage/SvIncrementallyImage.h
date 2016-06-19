//
//  SvIncrementallyImage.h
//  SvIncrementallyImage
//
//  Created by  maple on 6/27/13.
//  Copyright (c) 2013 maple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BLOCK)();

@interface SvIncrementallyImage : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, readonly) NSURL *imageURL;

@property (nonatomic, readonly) UIImage *image;

@property (nonatomic, copy)BLOCK block;

@property (nonatomic, copy)void(^MyBlock)();


- (id)initWithURL:(NSURL*)imageURL;

@end
