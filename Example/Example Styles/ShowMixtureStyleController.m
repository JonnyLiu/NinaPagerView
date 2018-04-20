//
//  TrainVC.m
//  BookingAppDemo
//
//  Created by Allen on 10/12/2017.
//  Copyright © 2017 Group3. All rights reserved.
//


#import "ShowMixtureStyleController.h"
#import "UIParameter.h"
#import "NinaPagerView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "FirstTableView.h"
#import "SecondTableView.h"
#import "ForthCollectionView.h"
#import "TopTabTestController.h"

@interface ShowMixtureStyleController ()<NinaPagerViewDelegate,ScrollHiddenDelegate>
@property (nonatomic, strong) NinaPagerView *ninaPagerView;
@end

@implementation ShowMixtureStyleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ninaPagerView];
    //Reload Titles and Objects
//    [self performSelector:@selector(reloadTopTabAndScrollView) withObject:nil afterDelay:5.0];
}

// 隐藏 navigation
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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

/**
 *  WithObjects传入方法3：适用于IB创建或者需要代码实例化创建的VC，如果您有此需求，请传入对应的VC即可，具体实现可参照下方代码。
 *  If you think vcs is not comfortable for your project, you can use view arrays to built.Just put views into array.
 *
 *  @return Array of views or controllers
 */
- (NSArray *)ninaDetailVCsArray {
    //Test init views and viewcontrollers,support creating views or viewcontroller by xib.
  /*  TopTabTestController *firstVC = [TopTabTestController new];
    firstVC.upScrollDelegate = self;
    SecondViewController *secondVC = [SecondViewController new];
    FirstTableView *firstTV = [[FirstTableView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_VIEW_HEIGHT) style:UITableViewStylePlain];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    ForthCollectionView *forthCollectionView = [[ForthCollectionView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) collectionViewLayout:layout];
   */
    UIStoryboard *FifthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *fifthVC = [FifthStory instantiateViewControllerWithIdentifier:@"111"];
    UIStoryboard *sixthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *sixthVC = [sixthStory instantiateViewControllerWithIdentifier:@"222"];
    UIStoryboard *seventhStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *seventhVC = [seventhStory instantiateViewControllerWithIdentifier:@"333"];
    UIStoryboard *eighthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *eighthVC = [eighthStory instantiateViewControllerWithIdentifier:@"444"];
    UIStoryboard *ninthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *ninthVC = [ninthStory instantiateViewControllerWithIdentifier:@"555"];
    return @[
      //       firstVC,
       //      secondVC,
       //      firstTV,
       //      forthCollectionView,
             fifthVC,
             sixthVC,
             seventhVC,
             eighthVC,
             ninthVC
             ];
}

#pragma mark - ScrollHiddenDelegate
- (void)upScrollAction:(BOOL)show {
    //If you wanna to make toptab hidden or show,you can try following codes and choose detailVCsArray(Line 39) as your default vcs array:
    //    self.ninaPagerView.topTabScrollHidden = show?NO:YES;
}

#pragma mark - LazyLoad
- (NinaPagerView *)ninaPagerView {
    if (!_ninaPagerView) {
        NSArray *titleArray = [self ninaTitleArray];
        NSArray *vcsArray = [self ninaDetailVCsArray];
        // 顶部栏 边距
        CGRect pagerRect = CGRectMake(0, 20, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT);
        _ninaPagerView = [[NinaPagerView alloc] initWithFrame:pagerRect WithTitles:titleArray WithObjects:vcsArray];
        // 顶部栏 配色
        _ninaPagerView.ninaPagerStyles = NinaPagerStyleStateNormal;
        _ninaPagerView.selectTitleColor = [UIColor whiteColor];
        _ninaPagerView.unSelectTitleColor = [UIColor whiteColor];
        _ninaPagerView.topTabBackGroundColor = [UIColor colorWithRed:0 green:0.47843137250000001 blue:1 alpha:1];
    }
    return _ninaPagerView;
}

#pragma mark - Reload Titles and Objects
- (void)reloadTopTabAndScrollView {
    [self.ninaPagerView reloadTopTabByTitles:[self ninasTitleArray] WithObjects:[self ninasVCsArray]];
}

- (NSArray *)ninasTitleArray {
    return @[
             @"大连市",
             @"甘井子",
             @"星海广场",
             ];
}

- (NSArray *)ninasVCsArray {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    ForthCollectionView *forthCollectionView = [[ForthCollectionView alloc] initWithFrame:CGRectMake(0, 0, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) collectionViewLayout:layout];
    UIStoryboard *FifthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *fifthVC = [FifthStory instantiateViewControllerWithIdentifier:@"111"];
    UIStoryboard *sixthStory = [UIStoryboard storyboardWithName:@"NinaXibVC" bundle:nil];
    ChildBaseViewController *sixthVC = [sixthStory instantiateViewControllerWithIdentifier:@"222"];
    return @[
                     forthCollectionView,
                     fifthVC,
                     sixthVC,
                     ];
}

@end
