//
//  ZPProgress.m
//  ZPProgress
//
//  Created by zhaopeng on 16/3/4.
//  Copyright © 2016年 ZhaoPeng. All rights reserved.
//

#import "ZPProgress.h"

@implementation ZPProgress

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _zpprogressColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        _cacheColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        _progressColor = [UIColor colorWithRed:254/255.0 green:205/255.0 blue:52/255.0 alpha:1];
        _font = [UIFont fontWithName:@"Courier" size:10];
        _lineWidth = 5;
        _progress = 0;
        _cacheValue = 0;
        
    }
    return self;
}

- (void)setProgress:(float)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)setCacheValue:(float)cacheValue {
    _cacheValue = cacheValue;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"asdfasf");
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, (rect.size.width-_lineWidth)/2, -M_PI_2, M_PI*2, 0);
    CGContextSetLineWidth(context, _lineWidth);
    const CGFloat *componentsZPProgress = CGColorGetComponents(_zpprogressColor.CGColor);
    float componentsZPProgressRed = componentsZPProgress[0];
    float componentsZPProgressGreen = componentsZPProgress[1];
    float componentsZPProgressBlue = componentsZPProgress[2];
    CGContextSetRGBStrokeColor(context, componentsZPProgressRed, componentsZPProgressGreen, componentsZPProgressBlue, 1);
    CGContextStrokePath(context);
    
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, (rect.size.width-_lineWidth)/2, -M_PI_2, 2 * M_PI *_cacheValue - M_PI_2, 0);
    CGContextSetLineWidth(context, _lineWidth);
    const CGFloat *componentsCache = CGColorGetComponents(_cacheColor.CGColor);
    float cacheRed = componentsCache[0];
    float cacheGreen = componentsCache[1];
    float cacheBlue = componentsCache[2];
    CGContextSetRGBStrokeColor(context, cacheRed, cacheGreen, cacheBlue, 1);
    CGContextStrokePath(context);
    
    
    CGContextAddArc(context, rect.size.width/2, rect.size.height/2, (rect.size.width-_lineWidth)/2, -M_PI_2, 2 * M_PI *_progress - M_PI_2, 0);
    CGContextSetLineWidth(context, _lineWidth);
    const CGFloat *components = CGColorGetComponents(_progressColor.CGColor);
    float progressRed = components[0];
    float progressGreen = components[1];
    float progressBlue = components[2];
    CGContextSetRGBStrokeColor(context, progressRed, progressGreen, progressBlue, 1);
    CGContextStrokePath(context);
    
    NSString *percent = [NSString stringWithFormat:@"%.1f%@", _progress*100, @"％"];
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{ NSFontAttributeName: _font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    CGRect r = [percent boundingRectWithSize:rect.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    [percent drawInRect:CGRectMake(0, (rect.size.height-r.size.height)/2, rect.size.width, r.size.height) withAttributes:attributes];
    
}






@end
