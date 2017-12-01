# XFDesignEvaluate
自定义评价界面 星级 标签自适应

## 1.自定义评价界面 星级 标签自适应评价  星星 点击之后联动标签;
## 2.标签自适应 标签换行 创建标签之后可生成自适应的View:
### 1).修改颜色大小等更多属性等你自定义;
###  2).可默认选择 默认标签的选择 是数组 只要传入对应标签的下标即可默认选中;
### 3).可单选可多选或不可选;
### 4).标题重置。

## 自定义评价界面
/**
所选信息 单选
*/
@property (nonatomic, copy) void (^infoButton)(XFEvaluateRank * button); /**< 完成回调信息 */
@property (nonatomic, copy) NSArray <NSArray *>*  imgArr; /**< 图片 */
@property (nonatomic, assign) BOOL  isSingleSelected; /**< 默认为开启单选（YES）  NO为选择本身及之前所有 */
-(void)addSubButtons;/**< 添加buttons 5 需要放在属性设置之后 */
```
#pragma mark - 单独评价星级
//初始化， 高度可自定义 距离左右边界默认值自定义PrefixHeader文件中
XFEvaluateView * evaView = [[XFEvaluateView alloc] initWithFrame:CGRectMake(0, 53.5 - 7.5, [UIScreen mainScreen].bounds.size.width, 50)];
evaView.isSingleSelected = YES;
__weak typeof(self) weakSelf = self;
evaView.infoButton = ^(XFEvaluateRank *button) {
[weakSelf updateUIButton:button];
};
//放在设置属性和block 之后
[evaView addSubButtons];
[self addSubview:evaView];

```
## 自定义标签
/**
关于button的参数设置 这个需要写在 XFTagsView

btnDistance     按钮间隙
btnTopDistance  按钮上下
btnWidth        按钮初始宽度
btnHeight       按钮初始高度
.....

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

/**
初始化标签
这个方法需要你放在
所有属性都设置完成之后
去使用

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


```
#pragma mark - 单独标签自适应
//初始化
self.xfTagsView = [[XFTagsView alloc] initWithFrame:CGRectMake(0, 132 - 10, [UIScreen mainScreen].bounds.size.width, 100)];
__weak XFCustomEView * weakSelf = self;
self.xfTagsView.infoButtonBlock = ^(UIButton *button) {
//存入tag 方便获取外部对应数据
//doSomething coding
}

/*中间增加属性 如 @property (nonatomic, strong) UIColor *unselectTitleColor; /**< 未选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectTitleColor; /**< 选中时按钮颜色 */
@property (nonatomic, strong) UIColor *selectborderColor; /**< 选中时边框颜色 */
@property (nonatomic, strong) UIColor *unselectborderColor; /**< 未选中时边框颜色 */
修改颜色大小等更多属性等你自定义
*/

[self.xfTagsView initButtonWith:_titlesArr isEnable:YES];//一切属性的定义都需要放在这个方法之前
[self addSubview:self.xfTagsView];
```

## 自定义星级评价带标签

@property (nonatomic, copy) void (^refreshView)(XFEvaluateRank *button); /**< 更新 */
@property (nonatomic, strong) NSMutableArray * resultArray; /**< 只存 评价级别 评价状态  评价标签 最终要的结果 例：@[ @"1" @"很好" @[标签数组标签的下标0，1...] ]*/
@property (nonatomic, copy) NSArray * titlesArr; /**< 标签数组 */
/**
如果选择并且数目大于0则显示标签 当选择星级之后执行方法 动态改变视图
*/
- (void)addDymView;

```
#pragma mark - 星级和自适应标签
@property (nonatomic, strong) NSMutableArray <NSMutableArray *>* tagNameArray; /**< 标签名字数组 */
_tagNameArray = [[NSMutableArray alloc] init];
[_tagArray addObjectsFromArray:@[[[NSMutableArray alloc] initWithArray:@[@"爱情", @"不是", @"一个糖"]],
[[NSMutableArray alloc] initWithArray:@[@"爱情", @"不是", @"一杯水"]],
[[NSMutableArray alloc] initWithArray:@[@"爱情", @"更不是", @"不是简简单单的甜言蜜语"]],
[[NSMutableArray alloc] initWithArray:@[@"爱情", @"而是", @"万里挑一的灵魂碰撞", @"有趣的灵魂总是俺么万里挑一"]],
[[NSMutableArray alloc] initWithArray:@[@"我们", @"遇见", @"即珍惜"]]]];
//初始化
self.evalueTopBgView = [[XFCustomEView alloc] init];
self.evalueTopBgView.titlesArr = self.tagNameArray[0];
__weak typeof(self) weakSelf = self;
self.evalueTopBgView.refreshView = ^(XFEvaluateRank *button) {
weakSelf.evalueTopBgView.titlesArr = weakSelf.tagNameArray[(int)button.tag - 100];
//动态修改
[weakSelf.evalueTopBgView addDymView];
};
[self.view addSubview:self.evalueTopBgView];

```

![image](https://github.com/FreeSnow520/XFDesignEvaluate/blob/master/imageExmp.gif)


