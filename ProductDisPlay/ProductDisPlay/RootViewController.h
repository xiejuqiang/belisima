//
//  RootViewController.h
//  ProductDisPlay
//
//  Created by apple on 13-9-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@class ContentView;
@class CourseView;
@class BigLoveView;
@class HeartView;
@class ContactUsView;
@class MemberView;
@class RecordDao;
@interface RootViewController : UIViewController<UIScrollViewDelegate,UIAlertViewDelegate,MBProgressHUDDelegate>
{
    UIScrollView *mScrollView;//首页scroll
    UIScrollView *menuScrollView;
    UIView *menuView;//半透明菜单
    UIButton *menuButton;//菜单上的按钮
    UIImageView *bgImageView;//背景图
    UIView *tileView;//产品块
    UIImageView *goodImageView;//产品图
    UIButton *tempButton;//保存按钮
    UIButton *tempSubButton;
    UIButton *subButton;
    float offsetX;
    int offsetY;
    NSMutableArray *menuButtonArray;
    NSMutableArray *submenuButtonArray;
    NSMutableArray *contentViewArray;
    int tempFlag;
    NSArray *sumArray;
    int tempFlag_now;
    ContentView *contentView;
    CourseView *courseView;
    BigLoveView *bigLoveView;
    HeartView *heartView;
    ContactUsView *contactUsView;
    MemberView *memberView;
    RecordDao *recordDao;
    MBProgressHUD *HUD;

    NSArray *buttonName;
    
    NSArray *subDataArr;//子类内容
    NSMutableArray *courseLargeImgArr;
    NSMutableArray *vipPackageImagArr;
    NSMutableArray *pNameArr;
    
}

@property (nonatomic,assign)int viewIndex;
@property (nonatomic,retain)NSArray *parentArr;
@property (nonatomic,retain)NSArray *childArr;
@property (nonatomic,retain)NSArray *sumDataArr;
@property (nonatomic,retain)NSArray *childPicArr;
@property (nonatomic,retain)NSArray *vipPackageArr;

@end
