//
//  SvIncrementallyImage.m
//  SvIncrementallyImage
//
//  Created by  maple on 6/27/13.
//  Copyright (c) 2013 maple. All rights reserved.
//

#import "SvIncrementallyImage.h"
#import <ImageIO/ImageIO.h>
#import <CoreFoundation/CoreFoundation.h>
#import "MBProgressHUD.h"

@interface SvIncrementallyImage () {
    NSURLRequest    *_request;
    NSURLConnection *_conn;
    
    CGImageSourceRef _incrementallyImgSource;
    
    NSMutableData   *_recieveData;
    long long       _expectedLeght;
    bool            _isLoadFinished;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *thumbImage;
@property (nonatomic, strong)MBProgressHUD *showHud;

@end

@implementation SvIncrementallyImage

- (id)initWithURL:(NSURL *)imageURL
{
    self = [super init];
    if (self) {

        
        _request = [[NSURLRequest alloc] initWithURL:imageURL];
        _conn    = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
        
        _incrementallyImgSource = CGImageSourceCreateIncremental(NULL);
        
        _recieveData = [[NSMutableData alloc] init];
        _isLoadFinished = false;
        

        

    }
    
    return self;
}


#pragma mark -
#pragma mark NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //        MBProgressHUD *showHud;
    for (MBProgressHUD *hud in [MBProgressHUD allHUDsForView:[UIApplication sharedApplication].keyWindow]) {
        
        //已经显示在页面上的hud
        _showHud = hud;
        break;
        
    }
    
    
    if (!_showHud) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.removeFromSuperViewOnHide = YES;
        hud.dimBackground = NO;
        hud.userInteractionEnabled = NO;
        _showHud = hud;
    }
    else {
        
        [NSObject cancelPreviousPerformRequestsWithTarget:_showHud];
        [_showHud show:NO];
    }
    
    
    _expectedLeght = response.expectedContentLength;
    NSLog(@"expected Length: %lld", _expectedLeght);
    
    NSString *mimeType = response.MIMEType;
    NSLog(@"MIME TYPE %@", mimeType);
    
    NSArray *arr = [mimeType componentsSeparatedByString:@"/"];
    if (arr.count < 1 || ![[arr objectAtIndex:0] isEqual:@"image"]) {
        NSLog(@"not a image url");
        [connection cancel];
         _conn = nil;
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection %@ error, error info: %@", connection, error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Connection Loading Finished!!!");
    
    // if download image data not complete, create final image
    if (!_isLoadFinished) {
        CGImageSourceUpdateData(_incrementallyImgSource, (CFDataRef)_recieveData, _isLoadFinished);
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(_incrementallyImgSource, 0, NULL);
        self.image = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    
    [_recieveData appendData:data];
    
    _isLoadFinished = false;
    if (_expectedLeght == _recieveData.length) {
        _isLoadFinished = true;
        
        [_showHud hide:YES afterDelay:.2];
        
//        if (self.block) {
//            
//            self.block();
//        }
        
        if (self.MyBlock) {
            
            self.MyBlock();
        }

    }
    
    CGImageSourceUpdateData(_incrementallyImgSource, (CFDataRef)_recieveData, _isLoadFinished);
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(_incrementallyImgSource, 0, NULL);
    self.image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
}

@end
