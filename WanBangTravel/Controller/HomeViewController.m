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

#define UISCREENHEIGHT  self.view.bounds.size.height
#define UISCREENWIDTH  self.view.bounds.size.width

@interface HomeViewController (){
    UIScreen *mainScreen;
    UIScrollView *_scrollView;
    UIImageView *_previousView;
    UIImageView *_currentView;
    UIImageView *_nextView;
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
    //CGFloat x = mainScreen.bounds.size.width -
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(100, 5, 30, 30)];
    [searchBar setPlaceholder:@"请输入搜索内容"];
    self.navigationItem.titleView = searchBar;
    
    [self createScrollView];
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

//
//- (void)setScrollView {
//    CGSize screenSize = [UIScreen mainScreen].bounds.size;
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.frame = CGRectMake(0, 20, screenSize.width, 200);
//
//    _scrollView = scrollView;
//    [_scrollView setContentSize:CGSizeMake(screenSize.width, 200)];
//    //  设置隐藏横向条
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    //  设置自动分页
//    _scrollView.pagingEnabled = YES;
//    //  设置代理
//    _scrollView.delegate = self;
//    //  设置当前点
//    _scrollView.contentOffset = CGPointMake(200, 0);
//    //  设置是否有边界
//    _scrollView.bounces = NO;
//    //  初始化当前视图
//    UIImageView *currentImageView =[[UIImageView alloc] init];
//    //NSString *imageURL = [[NSBundle mainBundle] pathForResource:@"image0" ofType:@"png"];
//    //currentImageView.image = [UIImage imageNamed:@"image0.png"];
//    currentImageView.backgroundColor  = [UIColor redColor];
//    [_scrollView addSubview:currentImageView];
//    _currentView = currentImageView;
//    _currentView.frame = CGRectMake(screenSize.width, 0, screenSize.width, 200);
//    _currentView.contentMode = UIViewContentModeScaleAspectFill;
//    //  初始化下一个视图
//    UIImageView *nextImageView = [[UIImageView alloc] init];
//    nextImageView.image = [UIImage imageNamed:@"image1.png"];
//    [_scrollView addSubview:nextImageView];
//    _nextView = nextImageView;
//    _nextView.frame = CGRectMake(screenSize.width * 2, 0, screenSize.width, 200);
//    _nextView.contentMode = UIViewContentModeScaleAspectFill;
//    //  初始化上一个视图
//    UIImageView *preImageView =[[UIImageView alloc] init];
//    preImageView.image = [UIImage imageNamed:@"image2.png"];
//    preImageView.frame = CGRectMake(0, 0, screenSize.width, 200);
//    [_scrollView addSubview:preImageView];
//    _previousView = preImageView;
//    _previousView.contentMode =UIViewContentModeScaleAspectFill;
//
//    self.tableView.tableHeaderView = scrollView;
//}

#pragma mark - 构建广告滚动视图
- (void)createScrollView
{
    AdScrollView *scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 40, UISCREENWIDTH, 150)];
    AdDataModel *dataModel = [AdDataModel adDataModelWithImageNameAndAdTitleArray];
    //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
    scrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    
    NSLog(@"%@",dataModel.adTitleArray);
    scrollView.imageNameArray = dataModel.imageNameArray;
    scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
    scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    
    [scrollView setAdTitleArray:dataModel.adTitleArray withShowStyle:AdTitleShowStyleLeft];
    
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    //[self.view addSubview:scrollView];
    //_scrollView = scrollView;
    self.tableView.tableHeaderView = scrollView;
}

@end
