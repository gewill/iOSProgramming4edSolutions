//
//  GWHypnosisViewController.m
//  HypnoNerd
//
//  Created by Will Ge on 7/28/15.
//  Copyright (c) 2015 gewill.org. All rights reserved.
//

#import "GWHypnosisViewController.h"
#import "GWHypnosisView.h"

@interface GWHypnosisViewController () <UITextFieldDelegate>

@end

@implementation GWHypnosisViewController


- (void)loadView
{
    // 创建一个 GWHypnosisView 对象
    GWHypnosisView * backgroundView = [[GWHypnosisView alloc] init];
    
    // add and init UITextField
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // setting UITextField
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"HYpnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.autocapitalizationType = YES;
    
    
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
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

// conform UITextField protocol
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    
    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // set text and color in UILabel
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        // fit size
        [messageLabel sizeToFit];
        
        // get random coordinate
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // set frame in UILabel
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // add UILabel to the View of GWHypnosisViewController
        [self.view addSubview:messageLabel];
        
        // add parallax effect
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.x"
                        type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        
        motionEffect = [[UIInterpolatingMotionEffect alloc]
                        initWithKeyPath:@"center.x"
                        type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        
    }
}



@end
