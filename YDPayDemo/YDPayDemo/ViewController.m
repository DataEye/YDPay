//
//  ViewController.m
//  YDPayDemo
//
//  Created by xqwang on 2016/12/26.
//  Copyright © 2016年 xqwang. All rights reserved.
//

#import "ViewController.h"
#import "YDPay.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [YDPay initWithAppId:@"testApp" developKey:@"testDevelop"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
