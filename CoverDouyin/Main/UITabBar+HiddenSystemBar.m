//
//  UITabBar+HiddenSystemBar.m
//  beniOS
//
//  Created by Ben on 17/4/21.
//  Copyright © 2017年 bengroup. All rights reserved.
//

#import "UITabBar+HiddenSystemBar.h"
#import "ZDTabBar.h"

@implementation UITabBar (HiddenSystemBar)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(layoutSubviews);
        SEL lxqSel = @selector(remove_layoutSubviews);
        
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method lxqMethod = class_getInstanceMethod([self class], lxqSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(lxqMethod), method_getTypeEncoding(lxqMethod));
        if (isAdd) {
            class_replaceMethod(self, lxqSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        } else {
            method_exchangeImplementations(systemMethod, lxqMethod);
        }
    });
}

- (void)remove_layoutSubviews{
    NSArray *subviews = self.subviews;
    for (UIView *subview in subviews) {
        if ([subview isKindOfClass:[ZDTabBar class]]) {
            
        } else {
            [subview removeFromSuperview];
        }
    }
    
}

@end
