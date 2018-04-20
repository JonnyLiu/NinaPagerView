//
//  ShowViewsStyleController.m
//  NinaPagerView
//
//  Created by RamWire on 2017/4/18.
//  Copyright © 2017年 RamWire. All rights reserved.
//

#import "ShowViewsStyleController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"

@interface ShowViewsStyleController ()
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation ShowViewsStyleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
}

#pragma mark - NinaParaArrays
- (NSArray *)ninaTitleArray {
    return @[
             @"火车票",
             @"机票",
             @"汽车/船票",
             @"酒店",
             @"专车",
             ];
}

- (NSArray *)ninaViewsArray {
    return @[
             @"FirstTableView",
             @"SecondTableView",
             @"ThirdTableView",
             @"FirstTableView",
             @"SecondTableView",
             ];
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *vcsArray = [self ninaViewsArray];
        CGRect pagerRect = CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:vcsArray];
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleSlideBlock;
    }
    return _ninaPagerView;
}

@end
