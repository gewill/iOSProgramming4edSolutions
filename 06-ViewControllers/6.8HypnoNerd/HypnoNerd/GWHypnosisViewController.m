//
//  GWHypnosisViewController.m
//  HypnoNerd
//
//  Created by Will Ge on 7/28/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWHypnosisViewController.h"
#import "GWHypnosisView.h"

@interface GWHypnosisViewController ()

@end

@implementation GWHypnosisViewController


- (void)loadView
{
    // 创建一个 GWHypnosisView 对象
    GWHypnosisView * backgroundView = [[GWHypnosisView alloc] init];
    
    // 将该对象赋给试图控制器的 view 属性
    self.view = backgroundView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"GWHypnosisViewController loaded its view.");
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // title
        self.tabBarItem.title = @"Hypnotize";
        
        // image
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
        
    }
    return self;
}

@end
