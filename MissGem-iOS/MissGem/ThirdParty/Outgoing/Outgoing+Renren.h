//
//  Outgoing+Renren.h
//  Outgoing
//
//  Created by xiang on 16/5/6.
//  Copyright © 2016年 ZhanxiangQu. All rights reserved.
//

#import "Outgoing.h"

@interface Outgoing (Renren)
+(void)connectRenrenWithAppId:(NSString *)appId AndAppKey:(NSString*)appKey;
+(BOOL)isRenrenInstalled;

+(void)shareToRenrenSession:(OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;
+(void)shareToRenrenTimeline:(OSMessage*)msg Success:(shareSuccess)success Fail:(shareFail)fail;

@end
