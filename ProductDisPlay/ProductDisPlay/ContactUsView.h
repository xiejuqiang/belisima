//
//  ContactUsView.h
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@class CategoryDBItem;
@interface ContactUsView : BaseView

@property (nonatomic,retain)CategoryDBItem *dataDic;
- (void)setContactView:(int)num;


@end
