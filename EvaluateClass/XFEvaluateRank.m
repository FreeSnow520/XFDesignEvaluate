//
//  XFEvaluateRank.m
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/17.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import "XFEvaluateRank.h"


@implementation XFEvaluateRank

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configSelf];
    }
    return self;
}


-(void)configSelf{
    //------ 默认样式
    //默认图片样式
    self.unselectImage = [UIImage imageNamed:@"eva_perfect"];
    self.selectImage = [UIImage imageNamed:@"eva_perfect_s"];
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height/2.0f;
    //根据需要设置图片填充模式
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    
    
    [self addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Touch Actions
- (void)btnClicked{
    if (!self.selected) {
        self.selected = YES;
        [self initIBeaconAnimate];
    }
    self.btnSelected(self);
}


-(void)initIBeaconAnimate{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 0.3;
    animation.repeatCount = 1;
    animation.autoreverses = YES;
    
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:1.4];
    [self.layer addAnimation:animation forKey:@"scale-layer"];
}

#pragma mark - Setter Methods
-(void)setSelectImage:(UIImage *)selectImage{
    _selectImage = selectImage;
    [self setImage:self.selectImage forState:UIControlStateSelected];
}

-(void)setUnselectImage:(UIImage *)unselectImage{
    _unselectImage = unselectImage;
    [self setImage:self.unselectImage forState:UIControlStateNormal];
}


@end
