//
//  ViewController.m
//  XFEvaluateController
//
//  Created by FreeSnow on 2017/11/30.
//  Copyright © 2017年 FreeSnow. All rights reserved.
//

#import "ViewController.h"
#import "XFCustomEView.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray <NSMutableArray *>* tagArray; /**< 标签数组 */
@property (nonatomic, strong) NSMutableArray * tagNameArray; /**< 标签名字数组 */
@property (nonatomic, strong) XFCustomEView * evalueTopBgView; /**< 顶部评价背景 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self insertTopView];
}

- (void)insertTopView{
    self.evalueTopBgView = [[XFCustomEView alloc] init];
    self.evalueTopBgView.titlesArr = self.tagNameArray[0];
     __weak typeof(self) weakSelf = self;
    self.evalueTopBgView.refreshView = ^(XFEvaluateRank *button) {
        weakSelf.evalueTopBgView.titlesArr = weakSelf.tagNameArray[(int)button.tag - 100];
        [weakSelf.evalueTopBgView addDymView];
    };
    [self.view addSubview:self.evalueTopBgView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray<NSMutableArray *> *)tagArray{
    if (_tagArray == nil) {
        _tagArray = [[NSMutableArray alloc] init];
        [_tagArray addObject: [[NSMutableArray alloc] init]];
        [_tagArray addObject: [[NSMutableArray alloc] init]];
        [_tagArray addObject: [[NSMutableArray alloc] init]];
        [_tagArray addObject: [[NSMutableArray alloc] init]];
        [_tagArray addObject: [[NSMutableArray alloc] init]];
    }
    return _tagArray;
}

-(NSMutableArray *)tagNameArray{
    if (_tagNameArray == nil) {
        _tagNameArray = [[NSMutableArray alloc] init];
        [_tagNameArray addObject: [[NSMutableArray alloc] initWithArray:@[@"爱情", @"不是", @"一个糖"]]];
        [_tagNameArray addObject: [[NSMutableArray alloc] initWithArray:@[@"爱情", @"不是", @"一杯水"]]];
        [_tagNameArray addObject: [[NSMutableArray alloc] initWithArray:@[@"爱情", @"更不是", @"不是简简单单的甜言蜜语"]]];
        [_tagNameArray addObject: [[NSMutableArray alloc] initWithArray:@[@"爱情", @"而是", @"万里挑一的灵魂碰撞", @"有趣的灵魂总是俺么万里挑一"]]];
        [_tagNameArray addObject: [[NSMutableArray alloc] initWithArray:@[@"我们", @"遇见", @"即珍惜"]]];
    }
    return _tagNameArray;
}

@end
