//
//  BigLoveView.h
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@class CategoryDBItem;
@interface BigLoveView : BaseView

@property (nonatomic, retain)CategoryDBItem *DataDic;
- (void)setLoveView:(int)num;
@end
