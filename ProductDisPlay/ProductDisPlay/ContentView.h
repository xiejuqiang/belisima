//
//  ContentView.h
//  ProductDisPlay
//
//  Created by apple on 13-9-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@class EGOImageView;
@class EMAsyncImageView;
@class CategoryDBItem;
@interface ContentView : BaseView<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    UIScrollView *mScrollView;
    UIButton *picButton;
    UIView *thumbView;
    UIImageView *bigPicView;
    EMAsyncImageView *EMAImageView;
    CategoryDBItem *dicData;
    NSArray *urlStrArray;
    EGOImageView *imgView;
}
@property (nonatomic, retain)NSArray *DataArray;
- (void)setView:(int)num;


@end
