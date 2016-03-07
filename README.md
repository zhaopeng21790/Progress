# Progress
圆形进度条 环形进度条，ZPProgress进度条同时也支持缓存进度，并且使用简单，后续会持续添加新的功能和样式


#使用教程：

``` python
	ZPProgress *progressView = [[ZPProgress alloc] init];
    progressView.backgroundColor = [UIColor clearColor];
    progressView.frame = CGRectMake(100, 200, 50, 50);
    [self.view addSubview:progressView];
    progressView.lineWidth = 2;//调节线条宽度
    progressView.progressColor = [UIColor colorWithRed:0.99 green:0.47 blue:0.47 alpha:1];//进度条的眼神
    progressView.cacheColor = [UIColor colorWithRed:1 green:0.47 blue:0.47 alpha:1];//调节缓存进度条的眼神
```






