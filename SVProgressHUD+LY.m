//
//  SVProgressHUD+LY.m
//  POPPassword
//
//  Created by 何烨 on 2020/6/24.
//  Copyright © 2020 luoxusheng. All rights reserved.
//

#import "SVProgressHUD+LY.h"

@implementation SVProgressHUD (LY)
/// 隐藏hud
+ (void)hideLoadingHUD{
    [self dismiss];
}

/// 加载中 默认加载中
+ (void)showLoadingHUD{
    // 如果当前视图还有其他提示框，就dismiss
    [self hideLoadingHUD];
    [self setDefaultStyle:SVProgressHUDStyleCustom];
    [self setForegroundColor:[UIColor grayColor]];
    [self setFont:[UIFont systemFontOfSize:13]];
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [self setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [self showLoadingHUDWithMessage:nil];
}

+ (void)showLoadingHUDWithMessage:(NSString *)message{
    if (message) {
        [self showLoadingHUD];
        [self showWithStatus:message];
    }else{
        [self showWithStatus:@"正在加载"];
    }
}

+ (void)showTextHUDWithMessage:(NSString *)message{
    [self hideLoadingHUD];
    [self setDefaultStyle:SVProgressHUDStyleCustom];
    [self setBackgroundColor:[UIColor grayColor]];
    [self setCornerRadius:5];
    [self setFont:[UIFont systemFontOfSize:13]];
    [self setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [self showImage:[UIImage imageNamed:@""] status:message];
    [self dismissWithDelay:1];
    
}

+ (void)showCompletionHUDWithMessage:(NSString *)message completion:(completeAction)completion{
    [self hideLoadingHUD];
    [self setDefaultStyle:SVProgressHUDStyleDark];
    [self setCornerRadius:5];
    [self setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [self showSuccessWithStatus:message];
    [self dismissWithDelay:2];
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

+ (void)showWarningHUDWithMessage:(NSString *)message completion:(completeAction)completion{
    [self hideLoadingHUD];
    [self setDefaultStyle:SVProgressHUDStyleDark];
    [self setCornerRadius:5];
    [self setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [self showErrorWithStatus:message];
    [self dismissWithDelay:2];
    if (completion) {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^{
            completion();
        });
    }
}

@end
