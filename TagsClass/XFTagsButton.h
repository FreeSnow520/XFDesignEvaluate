//
//  XFTagsButton.h
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/16.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol XFTagsButtonDelegate <NSObject>
//
//-(void)buttonClickedDelegate:(UIButton *)buttonsekf;
//
//@end

@interface XFTagsButton : UIButton
-(instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic, copy) void (^btnSelected)(XFTagsButton * button); /**< 回传buttton */

/**
 参数设置
 
 btnDistance     按钮间隙
 btnTopDistance  按钮上下
 btnWidth        按钮初始宽度
 btnHeight       按钮初始高度
 btnFontMargin   字体两旁间隙
 */
@property (nonatomic, assign) CGFloat  btnDistance; /**< 按钮间 间隙 */
@property (nonatomic, assign) CGFloat  btnTopDistance; /**< 按钮上下 间隙 */
@property (nonatomic, assign) CGFloat  btnWidth; /**< 按钮初始宽度 */
@property (nonatomic, assign) CGFloat  btnHeight; /**< 按钮初始高度 */
@property (nonatomic, assign) CGFloat  btnFontMargin; /**< 字体两旁间隙 */

@property (nonatomic, strong) UIColor *unselectTitleColor; /**< 未选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectTitleColor; /**< 选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectborderColor; /**< 选中时边框颜色 */
@property (nonatomic, strong) UIColor *unselectborderColor; /**< 未选中时边框颜色 */
@property (nonatomic, strong) UIColor *selectBgColor; /**< 选中背景颜色 */
@property (nonatomic, strong) UIColor *unselectBgColor; /**< 未选中背景颜色 */
@property (nonatomic, assign) CGFloat borderWidth; /**< 边框宽度 */
@property (nonatomic, strong) UIFont *titleLabelFont; /**< 字体大小 */
/**
  标题重置

 @param title 标题
 */
-(void)reSetTitle:(NSString *)title;

/**
 刷新UI
 */
-(void)updateUI;
@end
