//
//  ZDShootViewController.m
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/24.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import "ZDShootViewController.h"
#import "ZDPermissionView.h"
#import "ZDPermissionManager.h"

@interface ZDShootViewController ()

@end

@implementation ZDShootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"---%ld", [ZDPermissionManager checkWhetherPermissionView]);
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
