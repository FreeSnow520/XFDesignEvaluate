//
//  XFCustomEView.h
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/20.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFTagsView.h"
#import "XFEvaluateView.h"
#import "XFEvaluateRank.h"
@interface XFCustomEView : UIView
@property (nonatomic, copy) void (^refreshView)(XFEvaluateRank *button); /**< 更新 */
@property (nonatomic, strong) NSMutableArray * resultArray; /**< 只存 评价级别 评价状态  评价标签 最终要的结果 @"" @"" @[标签数组] */
@property (nonatomic, copy) NSArray * titlesArr; /**< 标签数组 */
/**
 如果选择并且数目大于0则显示标签
 */
- (void)addDymView;
@end
