//
//  CourseView.h
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"
@class EGOImageView;
@class CategoryDBItem;
@interface CourseView : BaseView<UIGestureRecognizerDelegate>
{
    NSArray *course1StrArr;
    NSArray *imageNameArr;
    NSArray *imageNameArr1;
    NSArray *buttonArr;
    NSArray *buttonArr1;
    NSArray *buttonArr2;
    UIView *thumbView;
    EGOImageView *bigPicView;
    CategoryDBItem *dicData;
    EMAsyncImageView *EMAImageView1;
    EMAsyncImageView *EMAImageView2;
    
    
}
@property (nonatomic) int flag;
@property (nonatomic, retain)NSArray *DataArray;
@property (nonatomic, retain)UIScrollView *mSV;
@property (nonatomic, retain)NSArray *largePicArray;
@property (nonatomic, retain)NSArray *vip_package_array;

- (void)setCourseView:(int)num;

@end
