//
//  Outgoing+BaoPaiement.h
//  Outgoing
//
//  Created by xiang on 16/5/6.
//  Copyright © 2016年 ZhanxiangQu. All rights reserved.
//

#import "Outgoing.h"

@interface Outgoing (BaoPaiement)
+(void)connectBaoPaiement;
+(void)BaoPaiement:(NSString*)link Success:(paySuccess)success Fail:(payFail)fail;
@end
