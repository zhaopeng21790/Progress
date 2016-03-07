//
//  ViewController.m
//  ZPProgress
//
//  Created by zhaopeng on 16/3/4.
//  Copyright © 2016年 ZhaoPeng. All rights reserved.
//

#import "ViewController.h"
#import "ZPProgress.h"

@interface ViewController () {

    NSTimer *timer1;
    NSTimer *timer2;
    ZPProgress *progressView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    progressView = [[ZPProgress alloc] init];
    progressView.backgroundColor = [UIColor clearColor];
    progressView.frame = CGRectMake(100, 200, 50, 50);
    [self.view addSubview:progressView];
    progressView.lineWidth = 2;
    progressView.progressColor = [UIColor colorWithRed:0.99 green:0.47 blue:0.47 alpha:1];
    
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(progressTimer) userInfo:nil repeats:YES];
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(cacheTimer) userInfo:nil repeats:YES];
    
}

- (void)progressTimer {
    if (progressView.progress >= 1) {
        [timer1 invalidate];
        return;
    }else {
        progressView.progress += 0.01;
    }
    
}

- (void)cacheTimer {
    progressView.cacheValue += 0.02;
    if (progressView.cacheValue >= 1) {
        [timer2 invalidate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
