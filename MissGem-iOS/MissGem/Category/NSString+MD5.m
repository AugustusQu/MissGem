//
//  NSString+MD5.m
//  leZhuoGameSDk
//
//  Created by xiang on 16/5/12.
//  Copyright © 2016年 ZhanxiangQu. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
- (NSString *)MD5 {
    
    const char * pointer = [self UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(pointer, (CC_LONG)strlen(pointer), md5Buffer);
    
    NSMutableString *string = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [string appendFormat:@"%02x",md5Buffer[i]];
    
    return string;
}


/*
 
 Return the hexadecimal string representation of the MD5 digest of the target
 NSString. In this example, this is used to generate a statistically unique
 ID for each fortune file.
 
 */
/*- (NSString *)MD5String;
{
    CC_MD5_CTX digestCtx;
    unsigned char digestBytes[CC_MD5_DIGEST_LENGTH];
    char digestChars[CC_MD5_DIGEST_LENGTH * 2 + 1];
    NSRange stringRange = NSMakeRange(0, [self length]);
    unsigned char buffer[128];
    NSUInteger usedBufferCount;
    CC_MD5_Init(&digestCtx);
    while ([self getBytes:buffer
                maxLength:sizeof(buffer)
               usedLength:&usedBufferCount
                 encoding:NSUnicodeStringEncoding
                  options:NSStringEncodingConversionAllowLossy
                    range:stringRange
           remainingRange:&stringRange])
        CC_MD5_Update(&digestCtx, buffer, (CC_LONG)usedBufferCount);
    CC_MD5_Final(digestBytes, &digestCtx);
    for (int i = 0;
         i < CC_MD5_DIGEST_LENGTH;
         i++)
        sprintf(&digestChars[2 * i], "%02x", digestBytes[i]);
    return [NSString stringWithUTF8String:digestChars];
}*/

@end
