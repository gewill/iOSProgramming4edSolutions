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
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    
    path.lineWidth = 10;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
}



@end
