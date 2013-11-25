//
//  CategoryDBItem.m
//  AiGuoZhe
//
//  Created by Tang silence on 13-7-27.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import "CategoryDBItem.h"

@implementation CategoryDBItem
@synthesize catId;
@synthesize catName;
@synthesize content;
@synthesize parentId;
@synthesize sortOrder;

- (void)initData:(NSArray *)dataArray
{
    self.catId = [dataArray objectAtIndex:0];
    self.catName = [dataArray objectAtIndex:1];
//    self.content = [dataArray objectAtIndex:2];
    self.parentId = [dataArray objectAtIndex:2];
    self.sortOrder = [dataArray objectAtIndex:3];
    self.content = [dataArray objectAtIndex:4];
}
@end
