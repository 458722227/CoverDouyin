//
//  ZDPermissionManager.m
//  CoverDouyin
//
//  Created by 4wd-ios on 2018/4/24.
//  Copyright © 2018年 ganglv. All rights reserved.
//

#import "ZDPermissionManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation ZDPermissionManager

+(BOOL)checkWhetherPermissionView{
    AVAuthorizationStatus videoAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (videoAuthStatus) {
        case AVAuthorizationStatusAuthorized:
            return YES;
            break;
        default:
            return NO;
            break;
    }
}

@end
