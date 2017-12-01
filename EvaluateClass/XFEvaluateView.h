//
//  XFEvaluateView.h
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/17.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XFEvaluateRank.h"



@interface XFEvaluateView : UIView

/**
 所选信息 单选
 */
@property (nonatomic, copy) void (^infoButton)(XFEvaluateRank * button); /**< 完成回调信息 */
@property (nonatomic, copy) NSArray <NSArray *>*  imgArr; /**< 图片 */
@property (nonatomic, assign) BOOL  isSingleSelected; /**< 默认为开启单选（YES）  NO为选择本身及之前所有 */
//初始化
-(instancetype)initWithFrame:(CGRect)frame images:(NSArray <NSArray *>*)imagsArray;
-(void)addSubButtons;/**< 添加buttons 5 */
@end
