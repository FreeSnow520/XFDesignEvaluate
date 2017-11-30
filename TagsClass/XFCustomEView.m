//
//  XFCustomEView.m
//  TagsLabelDemo
//
//  Created by FreeSnow on 2017/11/20.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import "XFCustomEView.h"

@interface XFCustomEView()
{
    BOOL _isFirstClicked;//默认是
}
//@property (nonatomic, strong) UIView * evalueTopBgView; /**< 顶部评价背景 */
@property (nonatomic, copy) NSArray * evalueTotalArr; /**< 评价总结 */
@property (nonatomic, strong) UILabel * totalEvaLabel; /**< 总评价标签 */
@property (nonatomic, strong) XFTagsView * xfTagsView; /**< 标签 */
@end
@implementation XFCustomEView

-(instancetype)init{
    if (self = [super init]) {
        [self configSelf];
    }
    return self;
}

- (void)configSelf{
    
    _isFirstClicked = YES;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, DefaultY, Main_Screen_Width, DefaultHeight);
    self.resultArray = [[NSMutableArray alloc] initWithArray:@[@"0", @"默认"]];
    NSMutableArray * marr = [[NSMutableArray alloc] init];
    [self.resultArray addObject:marr];
    [self insertTopView];
}


- (void)setTitlesArr:(NSArray *)titlesArr{
    _titlesArr = [titlesArr copy];
}

- (void)insertTopView{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, Main_Screen_Width, 14.5)];
    label.font = [UIFont systemFontOfSize:15];
    label.adjustsFontSizeToFitWidth = YES;
    label.text = @"本次消费还满意么";
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    self.totalEvaLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 98, Main_Screen_Width, 14.5)];
    self.totalEvaLabel.font = [UIFont systemFontOfSize:15];
    self.totalEvaLabel.adjustsFontSizeToFitWidth = YES;
    self.totalEvaLabel.text = @"一般";
    self.totalEvaLabel.textColor = [UIColor redColor];
    self.totalEvaLabel.textAlignment = NSTextAlignmentCenter;
    
    XFEvaluateView * evaView = [[XFEvaluateView alloc] initWithFrame:CGRectMake(0, 53.5 - 7.5, [UIScreen mainScreen].bounds.size.width, 50)];
    evaView.isSingleSelected = YES;
    __weak typeof(self) weakSelf = self;
    evaView.infoButton = ^(XFEvaluateRank *button) {
        [weakSelf updateUIButton:button];
    };
    [evaView addSubButtons];
    [self addSubview:evaView];
}

- (void) updateUIButton:(XFEvaluateRank *) button{
    //判断如果第一次点击则去reset这个view
    if (_isFirstClicked) {
        _isFirstClicked = NO;
        //说明没点击
        [self addSubview:self.totalEvaLabel];
        [self addDymView];
        
    }
    //等级
    NSArray * evaStrArr = @[@"非常差", @"较差", @"一般", @"较好", @"非常好"];
    [self.resultArray replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%d", (int)button.tag - 99]];
    // 等级文字显示
    [self.resultArray replaceObjectAtIndex:1 withObject:evaStrArr[button.tag - 100]];
    self.totalEvaLabel.text = evaStrArr[button.tag - 100];
    self.refreshView(button);
}

/**
 如果选择并且数目大于0则显示标签 动态刷新
 */
- (void)addDymView{
    if ( !(self.titlesArr.count > 0)) {
        return;
    }
    //每次动态刷新都移除标签组
    [self.resultArray[2] removeAllObjects];
    
    if (self.xfTagsView == nil) {
        self.xfTagsView = [[XFTagsView alloc] initWithFrame:CGRectMake(0, 132 - 10, [UIScreen mainScreen].bounds.size.width, 100)];
//        self.xfTagsView.isSingleSelected = YES;
    }
    
    __weak XFCustomEView * weakSelf = self;
    self.xfTagsView.infoButtonBlock = ^(UIButton *button) {
        //存入tag 方便获取外部对应数据
        if (button.selected) {
            [weakSelf.resultArray[2] addObject:[NSString stringWithFormat:@"%ld", (button.tag - 100)]];
        }else{
            [weakSelf.resultArray[2] removeObject:[NSString stringWithFormat:@"%ld", (button.tag - 100)]];
        }
        
    };
    
    [self.xfTagsView initButtonWith:_titlesArr isEnable:YES];

    [self addSubview:self.xfTagsView];
    self.frame = CGRectMake(0, 6, Main_Screen_Width, self.xfTagsView.frame.origin.y + self.xfTagsView.frame.size.height + 15);
}


@end
