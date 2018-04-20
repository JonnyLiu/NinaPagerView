

#import "ViewController.h"
#import "UIParameter.h"
#import "ShowControllersStyleController.h"
#import "ShowViewsStyleController.h"
#import "ShowMixtureStyleController.h"
#import "CostomTopStyleController.h"
#import "ReloadTabsObjectsController.h"

#define CELL_IDENTIFIER     @"cell"

@interface ViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *ninaPagerStyleTV;
@property (nonatomic, strong) NSArray *showTitlesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"返回";
   //self.showTitlesArray = @[@"地方选择",@"首页1",@"首页2",@"购物",@"推荐游玩点"];
    //self.showTitlesArray = @[@"主页"];
    ShowMixtureStyleController *showMixtureVC = [ShowMixtureStyleController new];
    [self.navigationController pushViewController:showMixtureVC animated:YES];
    //[self.view addSubview:self.ninaPagerStyleTV];
}
/*
#pragma mark - LazyLoad
- (UITableView *)ninaPagerStyleTV {
    if (!_ninaPagerStyleTV) {
        _ninaPagerStyleTV = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, FUll_VIEW_WIDTH, FUll_CONTENT_HEIGHT) style:UITableViewStyleGrouped];
        _ninaPagerStyleTV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _ninaPagerStyleTV.delegate = self;
        _ninaPagerStyleTV.dataSource = self;
        //if (@available(iOS 11.0, *)) {
          //  _ninaPagerStyleTV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //}
    }
    return _ninaPagerStyleTV;
}
*/

// 隐藏 title
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.showTitlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
    }
    cell.textLabel.text = self.showTitlesArray[indexPath.section];
    return cell;
}

/*
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            ShowControllersStyleController *showControllerVC = [ShowControllersStyleController new];
            [self.navigationController pushViewController:showControllerVC animated:YES];
        }
            break;
        case 1: {
            ShowViewsStyleController *showViewsVC = [ShowViewsStyleController new];
            [self.navigationController pushViewController:showViewsVC animated:YES];
        }
            break;
        case 0: {
            ShowMixtureStyleController *showMixtureVC = [ShowMixtureStyleController new];
            [self.navigationController pushViewController:showMixtureVC animated:YES];
        }
            break;
        case 3: {
            CostomTopStyleController *costomTopVC = [CostomTopStyleController new];
            [self.navigationController pushViewController:costomTopVC animated:YES];
        }
            break;
        case 4: {
            ReloadTabsObjectsController *reloadDataVC = [ReloadTabsObjectsController new];
            [self.navigationController pushViewController:reloadDataVC animated:YES];
        }
            break;
  
        default:
            break;
    }
}
 */
@end
