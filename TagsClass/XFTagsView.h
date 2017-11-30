//
//  XFTagsView.h
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/16.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFTagsView : UIView


/**
 关于button的参数设置
 
 btnDistance     按钮间隙
 btnTopDistance  按钮上下
 btnWidth        按钮初始宽度
 btnHeight       按钮初始高度
 
 */
@property (nonatomic, assign) CGFloat  btnDistance; /**< 按钮间 间隙 */
@property (nonatomic, assign) CGFloat  btnTopDistance; /**< 按钮上下 间隙 */
@property (nonatomic, assign) CGFloat  btnWidth; /**< 按钮初始宽度 */
@property (nonatomic, assign) CGFloat  btnHeight; /**< 按钮初始高度 */
@property (nonatomic, strong) UIColor *unselectTitleColor; /**< 未选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectTitleColor; /**< 选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectborderColor; /**< 选中时边框颜色 */
@property (nonatomic, strong) UIColor *unselectborderColor; /**< 未选中时边框颜色 */
@property (nonatomic, strong) UIColor *selectBgColor; /**< 选中背景颜色 */
@property (nonatomic, strong) UIColor *unselectBgColor; /**< 未选中背景颜色 */
@property (nonatomic, assign) CGFloat borderWidth; /**< 边框宽度 */
@property (nonatomic, strong) UIFont *titleLabelFont; /**< 字体大小 */
@property (nonatomic, assign) BOOL  isSingleSelected; /**< 默认为多选（default is NO）  NO为选择本身及之前 */
@property (nonatomic, strong) void (^infoButtonBlock)(UIButton * button); /**< 回传带有信息的button */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 初始化标签

 @param tagTitles 标签数组
 @param isEnable 按钮是否可点击 (default is YES 可点击)
 */
- (void)initButtonWith:(NSArray *)tagTitles isEnable:(BOOL)isEnable;

/**
 初始化后 设置button选中状态 （无触发无回调）
 isSingleSelected 属性开启 则为单选 默认设置下标最后一个为选中状态

 @param tagIndex 每个标签对应的下标数组[@"0",@"1",...]
 */
- (void)reSetButtonSelectStatus:(NSArray *)tagIndex;

@end
