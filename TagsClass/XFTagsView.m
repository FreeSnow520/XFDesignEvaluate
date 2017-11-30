//
//  XFTagsView.m
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/16.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//


#import "XFTagsView.h"
#import "XFTagsButton.h"


@interface XFTagsView()

@property (nonatomic, copy) NSArray * titleArray; /**< 标题 */

@end

@implementation XFTagsView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configSelf];
    }
    return self;
}
//
- (void)configSelf {
    self.backgroundColor = [UIColor whiteColor];
    //-----------------关于button的设置--------------------
    self.btnWidth = self.btnWidth?self.btnWidth:BWidth;
    self.btnHeight = self.btnHeight?self.btnHeight:BHeight;
    self.btnDistance = self.btnDistance?self.btnDistance:BDis;
    self.btnTopDistance = self.btnTopDistance?self.btnTopDistance:BTop;
    //
    self.titleLabelFont = self.titleLabelFont?self.titleLabelFont:[UIFont systemFontOfSize:15];
    self.selectTitleColor = self.selectTitleColor?self.selectTitleColor:UIColorFromRGB(0xf74547);
    self.selectborderColor = self.selectborderColor?self.selectborderColor:UIColorFromRGB(0xf74547);
    self.unselectTitleColor = self.unselectTitleColor?self.unselectTitleColor: UIColorFromRGB(0x999999);
    self.unselectborderColor = self.unselectborderColor?self.unselectborderColor:UIColorFromRGB(0x999999);
    //
    self.selectBgColor = self.selectBgColor?self.selectBgColor:[UIColor whiteColor];
    self.unselectBgColor = self.unselectBgColor?self.unselectBgColor:[UIColor whiteColor];
}

/**
 初始化标签
 
 @param tagTitles 标签数组
 @param isEnable 按钮是否可点击 (default is YES 可点击)
 */
-(void)initButtonWith:(NSArray *)tagTitles isEnable:(BOOL)isEnable {
    self.titleArray = tagTitles;
    //初始化
    for (UIButton *button in self.subviews) {
        [button removeFromSuperview];
    }
    for (int i = 0; i< tagTitles.count; i++) {
        //添加button
        XFTagsButton *button = [[XFTagsButton alloc] initWithFrame:CGRectMake(self.btnWidth * i + (i + 1)*self.btnDistance, self.btnTopDistance, self.btnWidth, self.btnHeight)];
        button.tag = 100 + i;
        [self configButton:button];
        [button updateUI];
        if (isEnable) {
            button.userInteractionEnabled = YES;
        }else{
            button.userInteractionEnabled = NO;
        }
        //
        [self addSubview:button];
        if (i != 0) {
            CGRect frame = ((UIButton *)[self viewWithTag:button.tag - 1]).frame;
            frame.origin.x += self.btnDistance + frame.size.width;
            frame.size = button.frame.size;
            button.frame = frame;
        }
        //
        [button reSetTitle:tagTitles[i]];
        __weak XFTagsView * weakSelf = self;
        button.btnSelected = ^(XFTagsButton *button) {
            //1. 反选---只有一个选中
            if (_isSingleSelected) {
                [weakSelf onlyOneSelected:button];
            }else{
                [weakSelf moreSelectedBtns:button];
            }
            //回传所选中的字段
            if (weakSelf.infoButtonBlock) {
                weakSelf.infoButtonBlock(button);
            }
            
        };
        if (i == tagTitles.count - 1) {
            //自适应View
            CGRect frame = ((UIButton *)[self viewWithTag:button.tag - 1]).frame;
            frame.origin.y = self.frame.origin.y;
            frame.origin.x = self.frame.origin.x;
            frame.size = CGSizeMake(self.frame.size.width, button.frame.origin.y + button.frame.size.height + self.btnTopDistance);
            self.frame = frame;
//            [self layoutIfNeeded];
        }
    }
}

#pragma mark - 设置button属性
- (void)configButton:(XFTagsButton *)btn {
    //-----------------重置关于button的设置--------------------
    btn.btnWidth = self.btnWidth?self.btnWidth:BWidth;
    btn.btnHeight = self.btnHeight?self.btnHeight:BHeight;
    btn.btnDistance = self.btnDistance?self.btnDistance:BDis;
    btn.btnTopDistance = self.btnTopDistance?self.btnTopDistance:BTop;
    //
    btn.titleLabelFont = self.titleLabelFont?self.titleLabelFont:[UIFont systemFontOfSize:15];
    btn.selectTitleColor = self.selectTitleColor?self.selectTitleColor:UIColorFromRGB(0xf74547);
    btn.selectborderColor = self.selectborderColor?self.selectborderColor:UIColorFromRGB(0xf74547);
    btn.unselectTitleColor = self.unselectTitleColor?self.unselectTitleColor: UIColorFromRGB(0x999999);
    btn.unselectborderColor = self.unselectborderColor?self.unselectborderColor:UIColorFromRGB(0x999999);
    //
    btn.selectBgColor = self.selectBgColor?self.selectBgColor:[UIColor whiteColor];
    btn.unselectBgColor = self.unselectBgColor?self.unselectBgColor:[UIColor whiteColor];
}


#pragma mark - Handler Methods

/**
 单选 反选
 */
- (void)onlyOneSelected:(XFTagsButton *)btn {
    //遍历所有子button
    for (XFTagsButton *xfBtn in self.subviews) {
        if (xfBtn != btn) {
            if (xfBtn.selected) {
                xfBtn.selected = NO;
                xfBtn.layer.borderColor = xfBtn.unselectborderColor.CGColor;
            }
        }
    }
    
}

/**
 多选 为选择本身及之前
 */
- (void)moreSelectedBtns:(XFTagsButton *)btn {
//    //遍历所有子button
//    for (int i = 100; i < self.titleArray.count + 100; i++) {
//        UIButton * button = (UIButton *)[self viewWithTag:i];
//        if (button.tag <= btn.tag) {
//            //全选
//            button.selected = YES;
//        }else{
//            button.selected = NO;
//        }
//
//    }
}

/**
 初始化后 设置button选中状态 （无触发无回调）
 isSingleSelected 属性开启 则为单选 默认设置下标最后一个为选中状态
 
 @param tagIndex 每个标签对应的下标数组[@"0",@"1",...]
 */
- (void)reSetButtonSelectStatus:(NSArray *)tagIndex {
    if (tagIndex && tagIndex.count > 0) {
        for (XFTagsButton * btn in self.subviews) {
            for (NSString * tagStr in tagIndex) {
                if (btn.tag - 100 == tagStr.integerValue) {
                    btn.selected = YES;
                    btn.layer.borderColor = btn.selectborderColor.CGColor;
                }
            }
        }
    }
    
}


#pragma mark - 大小 、距离、设置方法务必放在《initButtonWith...》方法之前
-(void)setBtnTopDistance:(CGFloat)btnTopDistance {
    _btnTopDistance = btnTopDistance;
}

- (void)setBtnHeight:(CGFloat)btnHeight {
    _btnHeight = btnHeight;
}

- (void)setBtnWidth:(CGFloat)btnWidth {
    _btnWidth = btnWidth;
}

- (void)setBtnDistance:(CGFloat)btnDistance {
    _btnDistance = btnDistance;
}

- (void)setUnselectBgColor:(UIColor *)unselectBgColor{
    _unselectBgColor = unselectBgColor;
}

-(void)setSelectBgColor:(UIColor *)selectBgColor{
    _selectBgColor = selectBgColor;
}

- (void)setUnselectTitleColor:(UIColor *)unselectTitleColor{
    _unselectTitleColor = unselectTitleColor;
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor{
    _selectTitleColor = selectTitleColor;
}

- (void)setUnselectborderColor:(UIColor *)unselectborderColor{
    _unselectborderColor = unselectborderColor;
}

- (void)setSelectborderColor:(UIColor *)selectborderColor{
    _selectborderColor = selectborderColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
}

@end
