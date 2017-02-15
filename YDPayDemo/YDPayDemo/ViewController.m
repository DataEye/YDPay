//
//  ViewController.m
//  YDPayDemo
//
//  Created by xqwang on 2016/12/19.
//  Copyright © 2016年 xqwang. All rights reserved.
//

#import "ViewController.h"
#import "YDPay.h"

@interface ViewController ()<YDPayDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [YDPay setDelegate:self];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 200, 80)];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"PayApp" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:button];
}

-(void)btnClick:(id)sender
{
    NSString* orderId = [self generateTradeNO];
    [YDPay pay:orderId orderName:@"购买元宝" userId:@"小李子" productNo:@"P000038" amount:1 param:@""];
}

-(void)payResult:(YDPayStatus)result data:(id)data
{
    if (result == YD_SUCCESS) {
        NSLog(@"pay success");
    }else{
        NSLog(@"pay result = %lu", result);
    }
    if (data) {
        NSLog(@"return data = %@", data);
    }
}

- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
