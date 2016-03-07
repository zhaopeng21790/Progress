//
//  ZPProgress.h
//  ZPProgress
//
//  Created by zhaopeng on 16/3/4.
//  Copyright © 2016年 ZhaoPeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPProgress : UIView


@property (nonatomic, strong) UIColor *zpprogressColor;
@property (nonatomic, strong) UIColor *cacheColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, assign) NSInteger lineWidth;

@property (nonatomic, assign) float progress;
@property (nonatomic, assign) float cacheValue;


@end
