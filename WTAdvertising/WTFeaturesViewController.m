//
//  WTFeaturesViewController.m
//  WTAdvertising
//
//  Created by wangtao on 2018/12/21.
//  Copyright © 2018年 wangtao. All rights reserved.
//

#import "WTFeaturesViewController.h"

@interface WTFeaturesViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *skipButton;
@property (nonatomic, strong) UIButton *startButton;

@end

@implementation WTFeaturesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
   
    self.scrollView.contentSize = CGSizeMake(width * self.dataSource.count, height);
    for (NSInteger index = 0; index < self.dataSource.count; index ++ ) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(index * width, 0, width, height)];
        imageView.image = [UIImage imageNamed:@"112.jpg"];
        if (index == self.dataSource.count - 1) {
            [imageView addSubview:self.startButton];
        }
        imageView.userInteractionEnabled = YES;
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.skipButton];
}

#pragma mark - method

- (void)skipAction:(UIButton *)sender {
    [self switchRootVC];
}

- (void)startAction:(UIButton *)sender {
    [self switchRootVC];
}

- (void)switchRootVC {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
      NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    if (page == self.dataSource.count) {

    }
}

#pragma mark - getter

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIButton *)skipButton {
    if (!_skipButton) {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipButton.frame = CGRectMake(self.view.bounds.size.width - 80, 20, 60, 30);
        _skipButton.backgroundColor = [UIColor whiteColor];
        [_skipButton setTitle:@"跳过" forState:UIControlStateNormal];
        [_skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_skipButton addTarget:self action:@selector(skipAction:) forControlEvents:UIControlEventTouchUpInside];
        _skipButton.layer.cornerRadius = 15;
        _skipButton.clipsToBounds = YES;
    }
    return _skipButton;
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton.frame = CGRectMake((self.view.bounds.size.width - 200)/2, self.view.bounds.size.height - 65, 200, 50);
        _startButton.backgroundColor = [UIColor whiteColor];
        [_startButton setTitle:@"开启" forState:UIControlStateNormal];
        [_startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
        _startButton.layer.cornerRadius = 25;
        _startButton.clipsToBounds = YES;
    }
    return _startButton;
}

@end
