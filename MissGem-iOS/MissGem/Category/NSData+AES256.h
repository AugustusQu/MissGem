//
//  NSData+AES256.h
//
//
//  Created by xiang on 2017/1/12.
//  Copyright © 2017年 ZhanxiangQu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

- (NSData*) encryptedWithKey:(NSData*) key;

- (NSData*) decryptedWithKey:(NSData*) key;

@end
