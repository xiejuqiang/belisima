//
//  JsonParser.h
//  MainFrame
//
//  Created by Tang silence on 13-7-2.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject
{
    id parentDelegate;
    SEL onCompleteCallback;
    SEL onNullCompleteCallback;
    SEL onErrorCompleteCallback;
    BOOL loading;
    BOOL success;
    BOOL parsed;
@private
    NSString *requestUrl;
    id returnDic;
    NSString *returnWY;
}

@property (copy, readonly) NSMutableData *itemData;
@property (nonatomic) BOOL isWY;

- (id)getItems;
- (void)parse:(NSString *)url withDelegate:(id)sender onComplete:(SEL)callback onErrorComplete:(SEL) errorCallBack onNullComplete:(SEL)nullCallBack;

@end
