//
//  XFEvaluateRank.h
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/17.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XFEvaluateRank;
//@protocol XFEvaluateRankDelegate <NSObject>
//
//- (void)infomationDelegate:(XFEvaluateRank *) button;
//@end
@interface XFEvaluateRank : UIButton

@property (nonatomic, copy) void (^btnSelected)(XFEvaluateRank * button); /**< 回传img */

@property (nonatomic, strong) UIImage *unselectImage; /**< 未选中时按钮颜色 */
@property (nonatomic, strong) UIImage *selectImage; /**< 选中时按钮颜色 */
@property (nonatomic, assign) NSInteger borderWidth; /**< 边框宽度 */

//@property (nonatomic, assign) id  <XFEvaluateRankDelegate> delegate; /**< 代理 */
@end

