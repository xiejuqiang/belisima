//
//  UrlStr.m
//  ProductDisPlay
//
//  Created by apple on 13-10-28.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "UrlStr.h"

//#define Default_urlStr @"http://192.168.1.208/bellissima/index.php?m=Categorybak&a=index"
#define Default_urlStr @"http://bellissima.medp.cn/index.php?m=Categorybak&a=index"

@implementation UrlStr

- (NSString *)returnURL:(int)urlId
{
    NSString *returnStr = nil;
    switch (urlId) {
        case 1:
            returnStr = [[NSString alloc]initWithFormat:Default_urlStr];
            NSLog(@"贝丽丝玛菜单列表:%@",returnStr);
            return [returnStr autorelease];
            break;
            
        default:
            break;
    }
    return nil;
}

@end
