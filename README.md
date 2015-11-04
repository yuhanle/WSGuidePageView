# WSGuidePageView
这是一个实用在app启动时添加引导页的分享
1.滑动时背景色渐变效果
2.自定义索引形式

###效果图

![效果图](https://github.com/yuhanle/WSGuidePageView/blob/master/demo.gif)

###配置：
- 初始化背景图和覆盖图
```
    // Added Introduction View Controller
    NSArray *coverImageNames = @[@"p1", @"p2", @"p3", @"p4"];
    NSArray *backgroundImageNames = @[@"p1_bg", @"p2_bg", @"p3_bg", @"p4_bg"];
```
- 设置进入应用的button
```
    // Example 2
    UIButton *enterButton = [UIButton new];
    enterButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [enterButton setTitleColor:[UIColor colorWithRed:75 / 255.0 green:70 / 255.0 blue:71 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    [enterButton setTitle:@"立即体验" forState:UIControlStateNormal];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"button_down"] forState:UIControlStateHighlighted];
    
    self.introductionView = [[WSIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames button:enterButton];
```
- 设置索引的形式 通过图片自定义
```
    // 设置索引图片
    [self.introductionView setImage:[UIImage imageNamed:@"index"]
                   highlightedImage:[UIImage imageNamed:@"index_sel"]
                          dotRadius:6.0f];
    
    self.window.rootViewController = self.introductionView;
    
    __weak AppDelegate *weakSelf = self;
    self.introductionView.didSelectedEnter = ^() {
        [weakSelf.introductionView.view removeFromSuperview];
        weakSelf.introductionView = nil;
        
        ViewController *mainVC = [[ViewController alloc] init];
        weakSelf.window.rootViewController = mainVC;
    };
```

###如有疑问，请联系我！！!
新浪微博:[@煜寒了](http://weibo.com/208484538/home?wvr=5)
