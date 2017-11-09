//
//  Outgoing+Weixin.h
//  Outgoing
//
//  Created by xiang on 16/5/6.
//  Copyright © 2016年 ZhanxiangQu. All rights reserved.
//

#import "Outgoing.h"

@interface Outgoing (Weixin)
/**
 *  https://open.weixin.qq.com 在这里申请
 *
 *  @param appId AppID
 */
+(void)connectWeixinWithAppId:(NSString *)appId;
+(BOOL)isWeixinInstalled;

+(void)shareToWeixinSession:(OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
+(void)shareToWeixinTimeline:(OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
+(void)shareToWeixinFavorite:(OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
+(void)WeixinAuth:(NSString*)scope Success:(authSuccess)success Fail:(authFail)fail;
+(void)WeixinPay:(NSString*)link Success:(paySuccess)success Fail:(payFail)fail;
@end
