//
//  XFTagsButton.m
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/16.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import "XFTagsButton.h"


@implementation XFTagsButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configSelf];
    }
    return self;
}

-(void)configSelf{
    //------ 默认样式 ------
    [self setTitle:@"按钮" forState:UIControlStateNormal];
    self.btnDistance = self.btnDistance?self.btnDistance:BDis;
    self.btnTopDistance = self.btnTopDistance?self.btnTopDistance:BTop;
    self.titleLabel.font = self.titleLabelFont?self.titleLabelFont:[UIFont systemFontOfSize:15];
    //
    self.selectTitleColor = self.selectTitleColor?self.selectTitleColor:UIColorFromRGB(0xf74547);
    self.selectborderColor = self.selectborderColor?self.selectborderColor:UIColorFromRGB(0xf74547);
    self.unselectTitleColor = self.unselectTitleColor?self.unselectTitleColor: UIColorFromRGB(0x999999);
    self.unselectborderColor = self.unselectborderColor?self.unselectborderColor:UIColorFromRGB(0x999999);
    //
    self.backgroundColor = self.unselectBgColor;
    self.btnHeight = self.btnHeight?self.btnHeight:self.frame.size.height;
    self.selectBgColor = self.selectBgColor?self.selectBgColor:[UIColor whiteColor];
    self.unselectBgColor = self.unselectBgColor?self.unselectBgColor:[UIColor whiteColor];
    //根据需要设置背景颜色
    [self setTitleColor:self.unselectTitleColor forState:UIControlStateNormal];
    [self setTitleColor:self.selectTitleColor forState:UIControlStateSelected];
    [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    //
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.height/2.0f;
    self.layer.borderColor = self.unselectborderColor.CGColor;
    self.layer.borderWidth = (self.borderWidth)?self.borderWidth:0.5f;
    //
    [self addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Touch Actions
- (void)btnClicked{
    self.selected = !self.selected;
    [self resetSelfConfig];
    self.btnSelected(self);
}

#pragma mark - Handler Methods
/**
 重新配置 ----自定义配置
 */
- (void)resetSelfConfig{
    if (self.selected) {
        self.layer.borderColor = self.selectborderColor.CGColor;
        self.backgroundColor = self.selectBgColor;
        [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    }else{
        self.layer.borderColor = self.unselectborderColor.CGColor;
        self.backgroundColor = self.unselectBgColor;
        [self setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

/**
 重新设置

 @param title 标题
 */
-(void)reSetTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
    [self resetButtonFrame];
}

/**
 根据高度和宽度来重设button的frame
 */
- (void)resetButtonFrame{
    //根据计算文字重置 宽度、高度
    [self setTagButtonMargin];
    //重新布局
    [self changePosition];
    
}

#pragma mark - ButtonSet
// 设置按钮的边距、间隙
- (void)setTagButtonMargin{
    // 按钮自适应
    [self sizeToFit];
    // 重新计算按钮文字左右间隙
    CGRect frame = self.frame;
    if (self.frame.size.width > Main_Screen_Width - ((self.btnFontMargin)?self.btnFontMargin:BFontMargin)*2) {
        //
        frame.size.width =  Main_Screen_Width - ((self.btnFontMargin)?self.btnFontMargin:BFontMargin)*2;
    }else{
        //
        frame.size.width += ((self.btnFontMargin)?self.btnFontMargin:BFontMargin)*2;
    }
    //
    frame.size.height = (self.btnHeight)?self.btnHeight:BTopMargin;
    self.frame = frame;
}

/**
 重新布局
 */
-(void)changePosition{
    //根据宽度来设置//计算高度
    CGRect frame = self.frame;
    CGFloat totalW = frame.size.width + frame.origin.x + ((self.btnDistance)?self.btnDistance:BDis);
    if (totalW > [UIScreen mainScreen].bounds.size.width) {
        //换行
        CGFloat bHeightY = frame.origin.y + ((self.btnTopDistance)?self.btnTopDistance:BTop) + frame.size.height;
        CGFloat bLeftX = (self.btnDistance)?self.btnDistance:BDis;
        frame.origin.x = bLeftX;
        frame.origin.y = bHeightY;
        self.frame = frame;
    }
}

- (void)updateUI {
    [self configSelf];
}
@end
