//
//  ViewController.m
//  bannerViewDemo
//
//  Created by 太和 on 15/8/7.
//  Copyright (c) 2015年 太和. All rights reserved.
//

#import "ViewController.h"
#import "SGFocusImageFrame.h"
#import "HomePageModel.h"
#import "MJExtension.h"

@interface ViewController ()<SGFocusImageFrameDelegate>

@property (nonatomic, strong)SGFocusImageFrame *bannerView;
@property (nonatomic, strong) NSMutableArray *arr;

@end

@implementation ViewController

- (NSMutableArray *)arr
{
    if (_arr == nil)
    {
        self.arr = [NSMutableArray array];
    }
    return _arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configBannerView];
    
    [self quereData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)configBannerView
{
    //建立banner图
    _bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    _bannerView.isAutoPlay = YES;
    _bannerView.delegate = self;
    _bannerView.changeFocusImageInterval = 3;
    [self.view addSubview:_bannerView];
    
}

- (void)quereData
{
    NSString *str1 = @"http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg";
    NSString *str2 = @"http://s6.mogujie.cn/b7/bao/130928/c7k0_kqyw6vckkfbgeq3wgfjeg5sckzsew_500x750.jpg_200x999.jpg";
    NSString *str3 = @"http://s6.mogujie.cn/b7/bao/131008/q2o17_kqyvcz3ckfbewv3wgfjeg5sckzsew_330x445.jpg_200x999.jpg";
    //包含字典的数组，每个字典key为photo,value为string
    NSArray *imageArr = [NSArray arrayWithObjects:@{@"photo":str1},@{@"photo":str2},@{@"photo":str3}, nil];
    
    //加载数据
    [_bannerView setImageURLs:imageArr];

}

/*
 bannerView item 点击方法
 */
- (void)foucusImageFrame:(SGFocusImageFrame *)imageFrame didSelectItem:(HomePageModel *)item
{
    NSLog(@"在此处进行跳转%@",item.extend);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
