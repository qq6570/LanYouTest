//
//  SVProgressHUD+LY.h
//  POPPassword
//
//  Created by 何烨 on 2020/6/24.
//  Copyright © 2020 luoxusheng. All rights reserved.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^__nullable completeAction)(void);
@interface SVProgressHUD (LY)

/// 隐藏hud
+ (void)hideLoadingHUD;

/// 加载中 默认加载中
+ (void)showLoadingHUD;

/// 加载中
/// @param message 文字提示（文字可为空）
+ (void)showLoadingHUDWithMessage:(nullable NSString *)message;

/// Tost
/// @param message 纯文字提示
+ (void)showTextHUDWithMessage:(nonnull NSString *)message;

/// Tost
/// @param message 失败提示
/// @param completion 回调
+ (void)showWarningHUDWithMessage:(nullable NSString *)message completion:(completeAction)completion;

/// Tost
/// @param message 完成提示
/// @param completion 回调
+ (void)showCompletionHUDWithMessage:(nullable NSString *)message completion:(completeAction)completion;

@end

NS_ASSUME_NONNULL_END
