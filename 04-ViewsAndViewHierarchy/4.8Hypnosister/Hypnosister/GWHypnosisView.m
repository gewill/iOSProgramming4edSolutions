//
//  GWHypnosisView.m
//  Hypnosister
//
//  Created by Will Ge on 7/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWHypnosisView.h"


@implementation GWHypnosisView

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // 根据 bounds 计算中心点
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
   
    
    // 根据视图宽高较小值确定圆的半径
//    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    // 使最外层圆形成为视图的外接圆
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
//    [path addArcWithCenter:center
//                    radius:radius
//                startAngle:0.0
//                  endAngle:M_PI * 2.0
//                 clockwise:YES];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    
    // 添加三角形，并添加渐变效果
    
    CGContextRef triangleContext = UIGraphicsGetCurrentContext();
    
    UIBezierPath *trianglePath = [[UIBezierPath alloc] init];
    [trianglePath moveToPoint:CGPointMake(center.x + bounds.size.width / 3, center.y + bounds.size.height / 3)];
    [trianglePath addLineToPoint:CGPointMake(center.x - bounds.size.width / 3, center.y + bounds.size.height / 3)];
    [trianglePath addLineToPoint:CGPointMake(center.x, center.y - bounds.size.height / 3)];
    [trianglePath addLineToPoint:CGPointMake(center.x + bounds.size.width / 3, center.y + bounds.size.height / 3)];
    [trianglePath stroke];
    
    CGContextSaveGState(triangleContext);
    [trianglePath addClip];
    
    
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 1.0, 0.0, 1.0,
        0.0, 0.5, 0.0, 1.0 };
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(center.x, center.y + bounds.size.height / 3 );
    CGPoint endPoint = CGPointMake(center.x, center.y - bounds.size.height / 3 );
    CGContextDrawLinearGradient(triangleContext, gradient, startPoint, endPoint, 0);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(triangleContext);
    
    // 添加阴影
    CGContextRef logoContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(logoContext);
    CGContextSetShadow(logoContext, CGSizeMake(4, 7), 3);
    
    
    // 添加logo，中心点为屏幕中心点
    CGRect logoFrame = CGRectMake(center.x - bounds.size.width / 4,  center.y - bounds.size.height / 4, bounds.size.width / 4 * 2, bounds.size.height / 4 * 2);
    UIImage *logoimage = [UIImage imageNamed:@"logo.png"];
    [logoimage drawInRect:logoFrame];
    UIView *logoView = [[UIView alloc]initWithFrame:logoFrame];
    [self.window addSubview:logoView];
    
    CGContextRestoreGState(logoContext);
    

    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置 GWHypnosisView 对象的背景色为透明
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}







@end
