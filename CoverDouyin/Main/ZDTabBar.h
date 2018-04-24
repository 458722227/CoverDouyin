//
//  ZDTabBar.h
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/24.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZDTabBar;
@protocol ZDTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZDTabBar *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;
- (void)tabBarClickPlusButton:(ZDTabBar *)tabBar;

@end

@interface ZDTabBar : UIView

@property(nonatomic, weak)id<ZDTabBarDelegate> delegate;

@end
