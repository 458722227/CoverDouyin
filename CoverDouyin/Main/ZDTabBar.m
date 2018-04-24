//
//  ZDTabBar.m
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/24.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import "ZDTabBar.h"

@interface ZDTabBar ()

@property(nonatomic, strong)NSMutableArray *buttonsArray;
@property(nonatomic, strong)UIView *topLine;
@property(nonatomic, strong)UIView *bottomLine;
@property(nonatomic, strong)UIButton *selectedBtn;

@end

@implementation ZDTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self setupBtns];
    }
    return self;
}

-(void)setupBtns{
    NSArray *btnTitles = @[@"首页", @"关注", @"", @"消息", @"我"];
    for (NSInteger i = 0; i < btnTitles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
        
        NSAttributedString *normalStr = [[NSAttributedString alloc] initWithString:btnTitles[i] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17], NSForegroundColorAttributeName:RGB_COLOR(166, 165, 168, 1)}];
        NSAttributedString *selectStr = [[NSAttributedString alloc] initWithString:btnTitles[i] attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [btn setAttributedTitle:normalStr forState:UIControlStateNormal];
        [btn setAttributedTitle:selectStr forState:UIControlStateSelected];
        if (0 == i) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
        if (2 == i) {
            [btn setImage:[UIImage imageNamed:@"post"] forState:UIControlStateNormal];
        }
        btn.tag = i + 1000;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttonsArray addObject:btn];
        [self addSubview:btn];
        [self addSubview:self.topLine];
        [self addSubview:self.bottomLine];
    }
    
    [self settingFrame];
}

-(void)btnClick:(UIButton *)btn{
    NSInteger tag = btn.tag - 1000;
    CGFloat W = APP_WIDTH / self.buttonsArray.count;
    
    if (tag != 2) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.bottomLine.transform = CGAffineTransformMakeTranslation(W*tag, 0);
        }];
        if (tag > 2) {
            tag -= 1;
        }
        if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
            [self.delegate tabBar:self didSelectedButtonFrom:self.selectedBtn.tag to:tag];
        }
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
        
        //设置背景色
        if (0 == tag) {
            self.backgroundColor = [UIColor clearColor];
            self.topLine.backgroundColor = RGB_COLOR(166, 165, 168, 0.5);
        }else{
            self.backgroundColor = [UIColor blackColor];
            self.topLine.backgroundColor = [UIColor blackColor];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(tabBarClickPlusButton:)]) {
            [self.delegate tabBarClickPlusButton:self];
        }
    }
}

-(void)settingFrame{
    CGFloat W = APP_WIDTH / self.buttonsArray.count;
    CGFloat H = self.bounds.size.height-3;
    for (NSInteger i = 0; i < self.buttonsArray.count; i++) {
        UIButton *btn = self.buttonsArray[i];
        btn.frame = CGRectMake(W*i, 1, W, H);
    }
    
    self.topLine.frame = CGRectMake(0, 0, APP_WIDTH, 1);
    self.bottomLine.frame = CGRectMake(W/2-18, self.bounds.size.height-2, 36, 2);
}

-(NSMutableArray *)buttonsArray{
    if (!_buttonsArray) {
        _buttonsArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _buttonsArray;
}

-(UIView *)topLine{
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = RGB_COLOR(166, 165, 168, 0.5);
    }
    return _topLine;
}

-(UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor whiteColor];
    }
    return _bottomLine;
}

@end
