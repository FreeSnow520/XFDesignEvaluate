//
//  XFEvaluateView.m
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/17.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import "XFEvaluateView.h"



@implementation XFEvaluateView

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray <NSArray *>*)imagsArray{
    if (self = [super initWithFrame:frame]) {
        [self configSelfWithImages:imagsArray];
    }
    return self;
}

- (void)configSelfWithImages:(NSArray <NSArray *>*)imagsArray{
    self.isSingleSelected = YES;
    self.backgroundColor = [UIColor whiteColor];
    if (!imagsArray || !imagsArray.count) {
        self.imgArr = [self.imgArr copy];
    }else{
        self.imgArr = imagsArray;
    }
}

/**
 添加buttons 5
 */
-(void)addSubButtons{
    //初始化
    for (UIButton *button in self.subviews) {
        [button removeFromSuperview];
    }
    //
    for (int i = 0; i< self.imgArr.count; i++) {
//        NSLog(@"%lf--%lf--%lf--%lf--%lf--%lf--%lf--%lf", Main_Screen_Width, Main_Screen_Height,SRate, StarDis, StarWidth * i + (i)*StarDis + StarBorderDis, StarTop, StarWidth, StarHeight);
        //添加button
        XFEvaluateRank *imgBtn = [[XFEvaluateRank alloc] initWithFrame:CGRectMake(StarWidth * i + (i)*StarDis + StarBorderDis, StarTop, StarWidth, StarHeight)];
        imgBtn.tag = 100 + i;
        imgBtn.unselectImage = [UIImage imageNamed:_imgArr[i][0]];
        imgBtn.selectImage = [UIImage imageNamed:_imgArr[i][1]];
        
        __weak typeof(self) weakSelf = self;
        imgBtn.btnSelected = ^(XFEvaluateRank *button) {
            //1. 反选---只有一个选中
            if (_isSingleSelected) {
                [weakSelf onlyOneSelected:button];
            }else{
                [weakSelf moreSelectedBtns:button];
            }
            weakSelf.infoButton(button);
        };
        [self addSubview:imgBtn];
    }
}

#pragma mark - Handler Methods
/**
 单选 反选
 */
- (void)onlyOneSelected:(XFEvaluateRank *)btn{
    //遍历所有子button
    for (XFEvaluateRank *button in self.subviews) {
        if (button != btn) {
            if (button.selected) {
                button.selected = NO;
            }
        }
    }
}

/**
 多选 为选择本身及之前所有
 */
- (void)moreSelectedBtns:(XFEvaluateRank *)btn{
    //遍历所有子button
    for (int i = 100; i < self.imgArr.count + 100; i++) {
        XFEvaluateRank * button = (XFEvaluateRank *)[self viewWithTag:i];
        if (button.tag <= btn.tag) {
            //全选
            button.selected = YES;
        }else{
            button.selected = NO;
        }
        
    }
}
#pragma mark - Delegate Methods
-(void)infomationDelegate:(XFEvaluateRank *)button{
    
}
#pragma mark - 懒加载
-(NSArray<NSArray *> *)imgArr{
    if (_imgArr == nil) {
        _imgArr = @[@[@"eva_bottom", @"eva_bottom_s"], @[@"eva_low", @"eva_low_s"], @[@"eva_level", @"eva_level_s"], @[@"eva_heigh", @"eva_heigh_s"], @[@"eva_perfect", @"eva_perfect_s"]];
    }
    return _imgArr;
}

@end
