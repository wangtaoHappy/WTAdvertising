//
//  ViewController.m
//  WTAdvertising
//
//  Created by wangtao on 2018/12/21.
//  Copyright © 2018年 wangtao. All rights reserved.
//

#import "ViewController.h"
#import "WTFeaturesViewController.h"
#import "WTAdvertiseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.bounds.size.width - 200)/2, self.view.bounds.size.height - 65, 200, 50);
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 25;
    button.clipsToBounds = YES;
    [self.view addSubview:button];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tapAdvertisingAction:) name:@"WTTapAdvertisingNotification" object:nil];
}

- (void)tapAdvertisingAction:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    NSLog(@"^_^%@",info);
}

- (void)startAction:(UIButton *)sender {
//    WTFeaturesViewController *vc = [[WTFeaturesViewController alloc] init];
//    vc.dataSource = @[@"",@"",@"",@""];
//    [self presentViewController:vc animated:YES completion:nil];
    WTAdvertiseViewController *vc = [[WTAdvertiseViewController alloc] init];
    vc.dataSource = @[@"",@"",@"",@""];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
