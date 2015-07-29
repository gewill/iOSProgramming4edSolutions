//
//  GWHypnosisView.m
//  Hypnosister
//
//  Created by Will Ge on 7/24/15.
//  Copyright © 2015 gewill.org. All rights reserved.
//

#import "GWHypnosisView.h"

@interface GWHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;



@end

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
    
    [self.circleColor setStroke];
    
    [path stroke];
    
    

    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置 GWHypnosisView 对象的背景色为透明
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


// mainSegmentControl: 方法用来相应 UISegmentedControl发的消息
- (void)mainSegmentControl:(UISegmentedControl *)segment
{
    
    if(segment.selectedSegmentIndex == 0)
    {
        // action for the first button (Current or Default)
        self.circleColor = [UIColor redColor];
    }
    else if(segment.selectedSegmentIndex == 1)
    {
        // action for the second button
        self.circleColor = [UIColor greenColor];
    }
    else if(segment.selectedSegmentIndex == 2)
    {
        // action for the third button
        self.circleColor = [UIColor blueColor];
    }
    
}


@end
