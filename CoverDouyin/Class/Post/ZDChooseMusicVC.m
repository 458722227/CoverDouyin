//
//  ZDChooseMusicVC.m
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/24.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import "ZDChooseMusicVC.h"
#import "ZDShootViewController.h"

@interface ZDChooseMusicVC ()

@end

@implementation ZDChooseMusicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"选择歌曲";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(APP_WIDTH/2-50, APP_HEIGHT/2-50-TOP_HEIGHT, 100, 100);
    [btn setTitle:@"拍摄" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shootClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

-(void)shootClick{
    ZDShootViewController *vc = [[ZDShootViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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

@end
