//
//  HGAuthentication.m
//  MissGem
//
//  Created by Augustus on 09/11/2017.
//  Copyright © 2017 Augustus. All rights reserved.
//

#import "GEMAuthentication.h"
#import <SAMKeychain/SAMKeychain.h>
#import "NSString+MD5.h"

#import "GEMNotificationString.h"


// SAMKeychain相关的参数
NSString * const kGEMAccount = @"uuid+user_id+install_timestamp";
NSString * const kGEMWeiXinAccount = @"uuid+user_id+install_timestamp";
NSString * const kGEMSAMKeychainServiceName = @"com.MissGem.MissGem";


// TODO 暂时存储在user default中
NSString * const kGEMInstallUserIdKey = @"GEMInstallUserId";
NSString * const kGEMInstallTimestamp = @"GEMInstallTimestamp";

// 授权的Metadata用到的分割字符串
NSString * const kGEMSeparatedCharacterForAuthMetadata = @"_";

extern NSString * const kGEMAuthTokenKey;

@interface GEMAuthentication ()

// 和服务器校验用户权限的字符串，具体查看方法 calculateTickt
@property (copy, nonatomic) NSString * ticket;
// 用于更新auth ticket的timestamp
@property (copy, nonatomic) NSString * refreshTimestamp;
// 安装并认证成功后的timestamp
@property (copy, nonatomic) NSString * installTimestamp;
// 用户id
@property (copy, nonatomic) NSString * installUserId;

//不同手机号对应的加密昵称信息 key:手机号码 value:TIDGetVerifyCodeResp
@property (strong, nonatomic) NSMutableDictionary * encryptedNicknameDictionary;
//key：手机号码 value：解密后的昵称
@property (strong, nonatomic) NSMutableDictionary * nicknameDictionary;

// 用于requestMetadata的认证信息
@property(nonatomic, readwrite) NSDictionary *authenticationMetadata;

@end

@implementation GEMAuthentication



#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        _isLogin = NO;
        _installUUID = [SAMKeychain passwordForService:kGEMSAMKeychainServiceName account:kGEMAccount];
        _installUserId = [[NSUserDefaults standardUserDefaults] stringForKey:kGEMInstallUserIdKey];
        _installTimestamp = [[NSUserDefaults standardUserDefaults] stringForKey:kGEMInstallTimestamp];
        
        NSLog(@"installUserId = %@ timestamp = %@ uuid = %@", _installUserId, _installTimestamp, _installUUID);
        if ([_installUUID length] == 0) {
            CFUUIDRef uuid = CFUUIDCreate(NULL);
            CFStringRef cfuuid = CFUUIDCreateString(NULL, uuid);
            _installUUID = [NSString stringWithFormat:@"%@", cfuuid];
            //TODO _installUUID
            [SAMKeychain setPassword:_installUUID forService:kGEMSAMKeychainServiceName account:kGEMAccount];
        }
        [self calculateTickt];
        
        _encryptedNicknameDictionary = [NSMutableDictionary dictionary];
        _nicknameDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark property

- (void)setRefreshTimestamp:(NSString *)refreshTimestamp {
    _refreshTimestamp = refreshTimestamp;
}

- (int64_t)authUserId {
    return [_installUserId longLongValue];
}

//- (NSDictionary *)authenticationMetadata {
//    if (![self hasValidTicket]) {
//        return [NSDictionary dictionary];
//    }
//
//    NSString *authValue = [NSString stringWithFormat:@"%@%@%@%@%@",
//                           _installUserId,
//                           kGEMSeparatedCharacterForAuthMetadata,
//                           _ticket,
//                           kGEMSeparatedCharacterForAuthMetadata,
//                           self.installUUID];
//    return @{kGEMAuthTokenKey : authValue};
//}

- (NSString *)authToken {
    if (![self hasValidTicket]) {
        return @"";
    }
    NSString *token = [NSString stringWithFormat:@"%@%@%@%@%@",
                           _installUserId,
                           kGEMSeparatedCharacterForAuthMetadata,
                           _ticket,
                           kGEMSeparatedCharacterForAuthMetadata,
                           self.installUUID];
    
    return token;
}

#pragma mark - LoginHandler
/*
- (void)receiveLoginViaMobileNumResult:(TIDLoginViaMobileNumResp *)response {
    if (response.errorCode == TIDErrorCodeForMobileLogin_Success) {
        _isLogin = YES;
        [self saveAuthDataWithUserId:[NSString stringWithFormat:@"%lld", response.userId]
                withInstallTimestamp:[NSString stringWithFormat:@"%lld", response.installTs]];
        [self setRefreshTimestamp:[NSString stringWithFormat:@"%lld", response.refreshTs]];
        [self calculateTickt];
    }
    else {
        _isLogin = NO;
    }
}

- (void)receiveRefreshLoginResult:(TIDRefreshLoginResp *)response {
    // login failed 清除数据，不再能自动登录了
    if (response.errorCode != TIDErrorCodeForMobileLogin_Success) {
        [self clearAuthData];
        _isLogin = NO;
    }
    else {
        _isLogin = YES;
    }
}

#pragma mark - Nickname

- (void)saveEncryptedNicknameMessage:(TIDGetVerifyCodeResp *)response {
    _encryptedNicknameDictionary[response.mobileNum] = response;
    //删除该手机号cache的解密昵称
    [_nicknameDictionary removeObjectForKey:response.mobileNum];
}
*/
- (NSString *)nicknameOfMobileNum:(NSString *)mobileNum decryptedBy:(NSString *)verifyCode {
    //验证码无效
//    if (![self isVerifyCodeValid:mobileNum verifyCode:verifyCode]) {
//        return nil;
//    }
    
    NSString *nickname = [_nicknameDictionary objectForKey:mobileNum];
    // 没有昵称，尝试解密
//    if (!nickname) {
//        nickname = [self decryptNickname:mobileNum verifyCode:verifyCode];
//    }
    return nickname;
}


/**
 当前输入的手机号码对应的验证码是否正确有效
 @return YES 有效的验证码
 */
/*
- (BOOL)isVerifyCodeValid:(NSString *)mobileNum verifyCode:(NSString *)verifyCode {
    // 验证码不能为空
    if (verifyCode.length == 0) {
        return NO;
    }
    // 没有该手机号码的加密昵称
    TIDGetVerifyCodeResp *resp = [_encryptedNicknameDictionary objectForKey:mobileNum];
    if (!resp) {
        return NO;
    }
    //验证码md5和服务器端的一致
    // NSLog(@"md5 = %@ %@", [self.verifyCodeField.text MD5], _encryptedVerifyCode);
    return [[verifyCode MD5] isEqualToString:resp.verifyCode];
}
*/
/**
 使用输入的验证码对昵称进行解密
 @return 解密成功返回昵称,解密失败返回nil
 *//*
- (NSString *)decryptNickname:(NSString *)mobileNum verifyCode:(NSString *)verifyCode {
    
    TIDGetVerifyCodeResp *resp = [_encryptedNicknameDictionary objectForKey:mobileNum];
    if (!resp) {
        return nil;
    }
    
    //该手机号码没有名字
    if (resp.nicknameArray.count == 0) {
        return nil;
    }
    
    //key
    NSData *keyData = [verifyCode dataUsingEncoding:NSUTF8StringEncoding];
    char *pKey = (char *)[keyData bytes];
    int keyIndex = 0;
    
    //encrypted nickname
    NSData *encryptedNickname = resp.nicknameArray[0];
    //deep copy一份，避免修改原数据
    NSData *nicknameData = [NSData dataWithBytes:[encryptedNickname bytes] length:[encryptedNickname length]];
    char *pNickname = (char *) [nicknameData bytes];
    
    //xor
    for (int i = 0; i < [nicknameData length]; ++i) {
        *pNickname = *pNickname ^ pKey[keyIndex % [keyData length]];
        pNickname++;
        keyIndex++;
    }
    NSString *nickname =  [[NSString alloc] initWithData:nicknameData encoding:NSUTF8StringEncoding];
    if (!nickname) {
        NSLog(@"decrypt nickname failed!");
        return nil;
    }
    else {
        _nicknameDictionary[mobileNum] = nickname;
    }
    return nickname;
}

#pragma mark - Login

- (TIDRefreshLoginReq *)refreshLoginRequest {
    TIDRefreshLoginReq *request = [[TIDRefreshLoginReq alloc] init];
    request.userId = [_installUserId longLongValue];
    int64_t refreshTimestamp = [[NSDate date] timeIntervalSince1970];
    [self setRefreshTimestamp:[NSString stringWithFormat:@"%lld", refreshTimestamp]];
    [self calculateTickt];
    request.refreshTs = refreshTimestamp;
    request.perInstallUuid = [self installUUID];
    request.ticket = _ticket;
    
    return request;
}
*/
- (void)saveAuthDataWithUserId:(NSString *)userId withInstallTimestamp:(NSString *)installTimestamp {
    _installUserId = userId;
    _installTimestamp = installTimestamp;
    
    [[NSUserDefaults standardUserDefaults] setObject:_installUserId forKey:kGEMInstallUserIdKey];
    [[NSUserDefaults standardUserDefaults] setObject:_installTimestamp forKey:kGEMInstallTimestamp];
    BOOL success = [[NSUserDefaults standardUserDefaults] synchronize];
    if (!success) {
        NSLog(@"saveAuthDataWithUserId failed!");
    }
    else {
        NSLog(@"saveAuthDataWithUserId success: installUserId = %@, timestamp = %@", _installUserId, _installTimestamp);
    }
}

// 清除认证数据
- (void)clearAuthData {
    _installTimestamp = nil;
    _installUserId = nil;
    _refreshTimestamp = nil;
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kGEMInstallUserIdKey];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:kGEMInstallTimestamp];
    [[NSUserDefaults standardUserDefaults] synchronize];

//    [SSKeychain setPassword:self.installUUID forService:kServiceName account:kGEMTurtleAccount];
}

// 是否拥有有效的认证数据
- (BOOL)hasValidAuthData {
    return [self.installUUID length] > 0 && [_installUserId length] > 0 && [_installTimestamp length] > 0;
}

- (void)didLgoout {
    _isLogin = NO;
    [self clearAuthData];
    [[NSNotificationCenter defaultCenter] postNotificationName:kAGTNotification_LogoutSuccess object:nil];
}

#pragma mark - Ticket

// 是否有可用的ticket数据
- (BOOL)hasValidTicket {
    return [self hasValidAuthData] && [_refreshTimestamp length] > 0;
}

// 计算ticket，避免重复计算
- (void)calculateTickt {
    if ([self hasValidTicket]) {
        NSString *foo = [NSString stringWithFormat:@"%@%@%@%@",
                         _installTimestamp,
                         _installUserId,
                         self.installUUID,
                         _refreshTimestamp];
        NSLog(@"ticket = %@", foo);
        _ticket = [[NSString stringWithFormat:@"%@%@%@%@",
                    _installTimestamp,
                    _installUserId,
                    self.installUUID,
                    _refreshTimestamp] MD5];
    }
}

@end
