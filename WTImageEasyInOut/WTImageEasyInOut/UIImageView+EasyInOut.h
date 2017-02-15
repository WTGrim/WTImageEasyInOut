//
//  UIImageView+EasyInOut.h
//  WTImageEasyInOut
//
//  Created by Dwt on 2017/2/15.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (EasyInOut)

- (void)setImageWithURL:(NSString *)ImageURL placeholderImage:(UIImage *)placeholderImage completed:(void(^)(UIImage *image))completed;

@end
