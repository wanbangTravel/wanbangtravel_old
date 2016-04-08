//
//  HomeViewController.m
//  WanBangTravel
//
//  Created by 沈凡 on 16/4/7.
//  Copyright © 2016年 mmt&sf. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationUtil.h"

@interface HomeViewController (){
    UIScreen *mainScreen;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
