//
//  GEMAuthentication.h
//  MissGem
//
//  Created by Augustus on 09/11/2017.
//  Copyright © 2017 Augustus. All rights reserved.
//

#import <Foundation/Foundation.h>






// 账号认证信息
@interface GEMAuthentication : NSObject

// 安装后生成的uuid
@property(copy, nonatomic, readonly) NSString *installUUID;

// 授权的用户id
@property(nonatomic, readonly) int64_t authUserId;

// 用于requestMetadata的认证信息
@property(nonatomic, readonly) NSDictionary *authenticationMetadata;

/**
 用于登录的token
 */
@property (nonatomic, readonly) NSString *authToken;

/**
 刷新登录的请求
 */
//- (TIDRefreshLoginReq *)refreshLoginRequest;

/**
 保存授权信息
 @param userId 用户id
 @param installTimestamp 安装时间戳，首次注册时从服务器获取
 */
- (void)saveAuthDataWithUserId:(NSString *)userId withInstallTimestamp:(NSString *)installTimestamp;

/**
 判断认证数据是否有效
 @return YES 有效
 */
- (BOOL)hasValidAuthData;

/**
 是否已经登录
 @return YES 已经登录
 */
@property (nonatomic, readonly) BOOL isLogin;

/**
 清除认证数据
 */
- (void)clearAuthData;

/**
 通过手机号码登录后返回的结果
 @param 通过手机号码登录请求返回的response
 */
//- (void)receiveLoginViaMobileNumResult:(TIDLoginViaMobileNumResp *)response;


/**
 刷新登录后的返回结果
 @param response 查看proto规格文件
 */
//- (void)receiveRefreshLoginResult:(TIDRefreshLoginResp *)response;

/**
 成功登出
 */
- (void)didLgoout;


/**
 保存验证码获取成功后，返回的昵称加密消息
 @param response 返回的message，可查看proto规格文件
 */
//- (void)saveEncryptedNicknameMessage:(TIDGetVerifyCodeResp *)response;

/**
 获取手机号对应的昵称
 @param mobileNum  手机号码
 @param verifyCode 用于解密昵称的验证码
 @return 如果该手机号对应的账号还没有昵称，将会返回nil; verifyCode不正确，返回nil
 */
- (NSString *)nicknameOfMobileNum:(NSString *)mobileNum decryptedBy:(NSString *)verifyCode;

@end
