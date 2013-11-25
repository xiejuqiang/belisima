//
//  HomeViewController.h
//  YueZi
//
//  Created by Tang silence on 13-9-10.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@class JsonParser;
@class UrlStr;
@class RecordDao;

@interface HomeViewController : UIViewController<MBProgressHUDDelegate>
{
    NSArray *imgArray; //首页效果图数组
    NSArray *rectArray; //存储效果坐标数组
    NSArray *classArray; //类数组
    JsonParser *jsonParser;
    UrlStr *urlStr;
    MBProgressHUD *HUD;
    RecordDao *recordDB;
    
    NSMutableArray *parentArr; //父类菜单名
    NSMutableArray *childArr;//子类菜单名
    NSMutableArray *sumDataArr;
    NSMutableArray *childPicArr;//子类图片名
    NSMutableArray *vipPackageArr;//子类图片名
}
@end
