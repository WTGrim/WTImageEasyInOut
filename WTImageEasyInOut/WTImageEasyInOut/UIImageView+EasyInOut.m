//
//  UIImageView+EasyInOut.m
//  WTImageEasyInOut
//
//  Created by Dwt on 2017/2/15.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import "UIImageView+EasyInOut.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (EasyInOut)


- (void)wt_setImageWithURL:(NSString *)ImageURL placeholderImage:(UIImage *)placeholderImage completed:(void (^)(UIImage *))completed{
    
    __weak typeof(self)weakSelf = self;
    [self sd_setImageWithURL:[NSURL URLWithString:ImageURL] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (image && cacheType == SDImageCacheTypeNone) {
            CATransition *animation = [CATransition animation];
            animation.duration = 0.2;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            animation.type = kCATransitionFade;
            [weakSelf.layer addAnimation:animation forKey:nil];
        }
    }];
}

@end
