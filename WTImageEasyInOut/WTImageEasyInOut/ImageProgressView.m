//
//  ImageProgressView.m
//  WTImageEasyInOut
//
//  Created by Dwt on 2017/3/1.
//  Copyright © 2017年 Dwt. All rights reserved.
//

#import "ImageProgressView.h"

@interface ImageProgressView ()

@property(nonatomic, strong)CAShapeLayer *bgLayer;
@property(nonatomic, strong)CAShapeLayer *arcLayer;

@end

@implementation ImageProgressView

- (CAShapeLayer *)bgLayer{
    
    if (!_bgLayer) {
        _bgLayer = [CAShapeLayer layer];
        _bgLayer.fillColor = [UIColor clearColor].CGColor;
        _bgLayer.strokeColor = [UIColor colorWithWhite:0 alpha:0.7].CGColor;
        _bgLayer.lineCap = kCALineCapRound;
        _bgLayer.lineJoin = kCALineJoinRound;
        _bgLayer.lineWidth = 2;
        _bgLayer.frame = CGRectMake(self.frame.size.height * 0.2, self.frame.size.height * 0.2, self.frame.size.height * 0.6, self.frame.size.height * 0.6);
        _bgLayer.path = [UIBezierPath bezierPathWithOvalInRect:_bgLayer.bounds].CGPath;
        [self.layer addSublayer:_bgLayer];
    }
    return _bgLayer;
}

- (CAShapeLayer *)arcLayer{
    if (!_arcLayer) {
        _arcLayer = [CAShapeLayer layer];
        _arcLayer.fillColor = [UIColor clearColor].CGColor;
        _arcLayer.strokeColor = [UIColor colorWithWhite:1 alpha:1].CGColor;
        _arcLayer.lineJoin = kCALineJoinRound;
        _arcLayer.lineCap = kCALineCapRound;
        _arcLayer.lineWidth = 2;
        _arcLayer.frame = self.bgLayer.frame;
        _arcLayer.path = [UIBezierPath bezierPathWithOvalInRect:_arcLayer.bounds].CGPath;
        [_arcLayer setValue:@(-M_PI_2) forKeyPath:@"transform.rotation.z"];
        _arcLayer.strokeEnd = 0;
        [self.layer addSublayer:_arcLayer];
    }
    return _arcLayer;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)show{
    
    self.arcLayer.strokeEnd = 0.3;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2;
    animation.repeatCount = MAXFLOAT;
    animation.toValue = @(M_PI * 1.5);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.arcLayer addAnimation:animation forKey:@"rotationAnimation"];
}

- (void)hide{
    
    [self.arcLayer removeAllAnimations];
    [self removeFromSuperview];
}


@end
