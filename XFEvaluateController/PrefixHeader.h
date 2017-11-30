//
//  PrefixHeader.h
//  XFEvaluateController
//
//  Created by FreeSnow on 2017/11/30.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#ifndef PrefixHeader_h
#define PrefixHeader_h


#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
#define SRate Main_Screen_Width/375.0f
// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue)\
\
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#pragma mark -----------关于评价背景view的初始设置----------
#define DefaultY 6.0f
#define DefaultHeight 115.0f

#pragma mark ------------评价星级----------------

#define StarWidth 35.0f
#define StarHeight 35.0f
#define StarTop  7.50f
//static const CGFloat BBottom = 7.50f;
#define StarBorderDis 50.0f * SRate
#define StarDis ((Main_Screen_Width - StarWidth * 5 - StarBorderDis * 2)/4.0f)

#pragma mark ------------评价标签----------------

//-----------------关于button的初始设置------------------
#define BDis 10.0f
#define BTop 15.0f
#define BFontMargin 10.0f
#define BTopMargin 30.0f
#define BWidth 73.0f
#define BHeight 30.0f


#endif /* PrefixHeader_h */
