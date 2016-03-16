//
//  WJHttpTool.m
//  百思不得姐
//
//  Created by 汪俊 on 16/2/17.
//  Copyright © 2016年 汪俊. All rights reserved.
//

#import "WJDownloadOperation.h"

@implementation WJDownloadOperation

/**
 *  在main方法中实现具体操作
 */
- (void)main
{
    @autoreleasepool {
        
        NSURL *downloadUrl = [NSURL URLWithString:self.url];
        NSData *data = [NSData dataWithContentsOfURL:downloadUrl]; // 这行会比较耗时
        UIImage *image = [UIImage imageWithData:data];
        //下载操作已经完成下载了
        if ([self.delegate respondsToSelector:@selector(downloadOperation:didFinishDownload:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{ // 回到主线程, 传递图片数据给代理对象
                [self.delegate downloadOperation:self didFinishDownload:image];
            });
        }
    }
}
@end
