//
//  CategoryDBItem.h
//  AiGuoZhe
//
//  Created by Tang silence on 13-7-27.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryDBItem : NSObject

@property (nonatomic,retain)NSString *catId;
@property (nonatomic,retain)NSString *catName;
@property (nonatomic,retain)NSString *content;
@property (nonatomic,retain)NSString *parentId;
@property (nonatomic,retain)NSString *sortOrder;
- (void)initData:(NSArray *)dataArray;

@end
