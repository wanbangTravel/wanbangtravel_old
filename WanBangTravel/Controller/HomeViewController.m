//
//  HomeViewController.m
//  WanBangTravel
//
//  Created by 沈凡 on 16/4/7.
//  Copyright © 2016年 mmt&sf. All rights reserved.
//

#import "HomeViewController.h"
#import "AdScrollView.h"
#import "AdDataModel.h"
#import "ButtonsView.h"
#import "ScrollTitleView.h"
#import "CollectionView.h"

#define UISCREENHEIGHT  self.view.frame.size.height
#define UISCREENWIDTH  self.view.frame.size.width


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIScreen *mainScreen;
    UIScrollView *_scrollView;
}
@property (strong, nonatomic) IBOutlet UITableView *homeTableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *leftBarBtn = [[UIButton alloc] init];
    leftBarBtn.frame = CGRectMake(20, 5, 50, 20);
    leftBarBtn.backgroundColor = [UIColor redColor];
    [leftBarBtn setTitle:@"南京" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarBtn];
    
    UIButton *rightBarBtn = [[UIButton alloc] init];
    leftBarBtn.frame = CGRectMake(150, 10, 50, 30);
    leftBarBtn.backgroundColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarBtn];
    //LocationUtil *util = [LocationUtil new];
    //[util locate];
    //AlertUtil *alert = [[AlertUtil alloc] init];
    //[alert showAlertViewWithTitle:@"tishi" andMsg:util.cityName];
    mainScreen = [UIScreen mainScreen];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 5, 30, 30)];
    [searchBar setPlaceholder:@"请输入搜索内容"];
    self.navigationItem.titleView = searchBar;

    [self createScrollView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, 700)];
    [headerView addSubview:_scrollView];
    
    ButtonsView *btnsView = [[ButtonsView alloc] initWithFrame:CGRectMake(0, 150, UISCREENWIDTH, 200) andRows:2 andColumns:4];
    [headerView addSubview:btnsView];
    
    ScrollTitleView *scrollTextView = [[ScrollTitleView alloc] initWithFrame:CGRectMake(0, 350, UISCREENWIDTH, 100)];
    [headerView addSubview:scrollTextView];
    
    CollectionView *collectionView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 450, UISCREENWIDTH, 200)];
    [headerView addSubview:collectionView];
    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - 构建广告滚动视图
- (void)createScrollView
{
    AdScrollView *scrollView = [[AdScrollView alloc] initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, 150)];
    AdDataModel *dataModel = [AdDataModel adDataModelWithImageNameAndAdTitleArray];
    //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
    //scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    scrollView.imageNameArray = dataModel.imageNameArray;
    [scrollView setAdTitleArray:dataModel.adTitleArray withShowStyle:AdTitleShowStyleLeft];
    scrollView.PageControlShowStyle = UIPageControlShowStyleCenter;
    scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _scrollView = scrollView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //IQTEstatic NSString *reuseId = @"homeTableViewCell";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setBackgroundColor:[UIColor purpleColor]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
@end
