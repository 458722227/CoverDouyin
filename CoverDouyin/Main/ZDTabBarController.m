//
//  ZDTabBarController.m
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/23.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import "ZDTabBarController.h"
#import "ZDTabBar.h"
#import "ZDMainViewController.h"
#import "ZDAttentionViewController.h"
#import "ZDMessageViewController.h"
#import "ZDMineViewController.h"

@interface ZDTabBarController () <ZDTabBarDelegate>

@end

@implementation ZDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCustomTabBar];
    
    [self setupChildVC];
}

-(void)setupCustomTabBar{
    ZDTabBar *tabBar = [[ZDTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
}

-(void)setupChildVC{
    ZDMainViewController *vc1 = [[ZDMainViewController alloc] init];
    [self addChildViewController:vc1];
    ZDAttentionViewController *vc2 = [[ZDAttentionViewController alloc] init];
    [self addChildViewController:vc2];
    ZDMessageViewController *vc3 = [[ZDMessageViewController alloc] init];
    [self addChildViewController:vc3];
    ZDMineViewController *vc4 = [[ZDMineViewController alloc] init];
    [self addChildViewController:vc4];
}

#pragma mark - ZDTabBarDelegate -

-(void)tabBarClickPlusButton:(ZDTabBar *)tabBar{
    
}

-(void)tabBar:(ZDTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
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
