//
//  RootViewController.m
//  ProductDisPlay
//
//  Created by apple on 13-9-6.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ContentView.h"
#import "CourseView.h"
#import "BigLoveView.h"
#import "HeartView.h"
#import "ContactUsView.h"
#import "MemberView.h"
#import "RecordDao.h"
#import "CategoryDBItem.h"
#import "EGOImageLoader.h"


@interface RootViewController ()

@end

@implementation RootViewController
@synthesize viewIndex;
@synthesize parentArr;
@synthesize childArr,childPicArr,vipPackageArr;
@synthesize sumDataArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        courseLargeImgArr = [[NSMutableArray alloc] init];
        vipPackageImagArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg.png"]];
    [self.view addSubview:bgImageView];
    [self parsedData];
    [self initData];
    
    [self createMenuView];
    [self createMenuScroll];
    [self createMenuButton:[buttonName count]+1];
    [self menuTap:[menuButtonArray objectAtIndex:self.viewIndex]];
	// Do any additional setup after loading the view.
}

- (void)parsedData
{
    recordDao = [[RecordDao alloc] init];
    [recordDao createDB:DATABASE_NAME];
    pNameArr = [[NSMutableArray alloc] init];
    NSMutableArray *sNameArr = [[NSMutableArray alloc] init];
    NSMutableArray *subDicArr = [[NSMutableArray alloc] init];
    NSString *sqlStr = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE parentId=%@ Order By sortOrder,catId",CATEGORY_TABLENAME,@"0"];
    pNameArr = [recordDao resultSetWhere:CATEGORY_TABLENAME Where:sqlStr];
    
    for (CategoryDBItem *pDic in pNameArr) {
        NSMutableArray *ssNameArr = [[NSMutableArray alloc] init];
         NSMutableArray *ssubDicArr = [[NSMutableArray alloc] init];
//        NSString *pName = [pDic objectForKey:@"cname"];
        NSString *pId = pDic.catId;
//        [pNameArr addObject:pName];
        for (CategoryDBItem *sDic in self.childArr) {
            
            NSString *sId = sDic.parentId;
            NSString *sName = sDic.catName;
            
            if ([sId isEqualToString:@"55"] || [sId isEqualToString:@"56"] || [sId isEqualToString:@"57"])
            {
                NSArray *largeArr = [sDic.content componentsSeparatedByString:@","];
                [courseLargeImgArr addObject:largeArr];
            }
            
            if ([sId isEqualToString:@"60"] || [sId isEqualToString:@"61"] || [sId isEqualToString:@"62"] || [sId isEqualToString:@"63"] || [sId isEqualToString:@"64"] || [sId isEqualToString:@"65"] || [sId isEqualToString:@"66"])
            {
                [vipPackageImagArr addObject:sDic];
            }
            
            if ([pId isEqualToString:sId]) {
                [ssNameArr addObject:sName];
                [ssubDicArr addObject:sDic];
            }
        }
        [sNameArr addObject:ssNameArr];
        [subDicArr addObject:ssubDicArr];
    }
    
    
//    [pNameArr insertObject:@"首页" atIndex:0];
    
    buttonName = pNameArr;
    [pNameArr retain];
    sumArray = sNameArr;
    subDataArr = subDicArr;
    NSLog(@"%@",self.parentArr);
    
}

- (void)initData
{

    menuButtonArray = [[NSMutableArray alloc] init];
    submenuButtonArray = [[NSMutableArray alloc] init];
    contentViewArray = [[NSMutableArray alloc] init];
    tempFlag_now = 0;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(setMenuViewHidden:) name:@"setMenuViewHidden" object:nil];
    
//    NSArray *array = @[@"品牌故事",@"会所实景"];
//    NSArray *array1 = @[@"健康管理课程",@"皮肤管理课程",@"曲线课程",@"体重课程"];
//    NSArray *array2 = @[@"5800元会员卡",@"12800元会员卡",@"22800元会员卡",@"49800元会员卡",@"99800元会员卡",@"199800元会员卡",@"380000元会员卡"];
//    NSArray *array3 = @[];
//    NSArray *array4 = @[];
//    NSArray *array5 = @[];
//    NSArray *array6 = @[];
//    
//    
//    sumArray = @[array,array1,array2,array3,array4,array5,array6];
//    [sumArray retain];
}

- (void)createScrollView
{
    mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:mScrollView];
    mScrollView.delegate = self;
    mScrollView.backgroundColor = [UIColor clearColor];
    mScrollView.contentSize = CGSizeMake(1024, 768);
}

- (void)createMenuScroll
{
    menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 180, 158, 768-250)];
    [menuView addSubview:menuScrollView];
//    menuScrollView.tag = 1000;
//    menuScrollView.delegate = self;
//    menuScrollView.backgroundColor = [UIColor redColor];
   
}

- (void)createTileView:(int)num
{
    NSMutableArray *imgNameArr = [[NSMutableArray alloc] init];
    NSArray *title_name_arr = @[@"贝丽丝玛",@"会所实景",@"专业团队",@"课程项目",@"大家大爱"];
    NSArray *desc_arr = @[@"贝丽丝玛（Bellissima）成立于2010年，国际化、专业化女性亚健康调理机构，目前为千余位高端会员提供尊享服务，拥有高科技的检测设备.",
                        @"贝丽丝玛现拥有四家连锁机构（分别位于小白楼商圈、海光寺商圈和梅江商圈），仍在不断壮大中",
                        @"贝丽丝玛服务团队包括名医专家、美疗师团队和增值服务团队，其中增值服务团队包括特聘及合作单位的专家学者、行业精英，涵盖营养健康。",
                        @"当您从都市的繁忙与纷扰中走来，步入传说中的桃花源般的会所，一直以来的那份说不出来的沉重，竟不知不觉地悄悄溜走。",
                        @"作为美业的从业人员，我深深的感受到了那一种荣耀，为越来越多的女性同胞带来健康和活力便成了我心目中的一个坚定不变的信念."];
    for (int i = 0; i < num; i++) {
        NSString *str = [[NSString alloc] initWithFormat:@"good_%d.png",i +1];
        [imgNameArr addObject:[UIImage imageNamed:str]];
    }
       for (int i = 0; i < num; i++) {
        tileView = [[UIView alloc] initWithFrame:CGRectMake(158+252*i, 0, 251, 768)];
        tileView.backgroundColor = [UIColor whiteColor];
        [mScrollView addSubview:tileView];

        if (i>0)
        {
            
            UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(tileView.frame.origin.x-1, 0, 1, 768)];
            [mScrollView addSubview:lineLabel];
            lineLabel.backgroundColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        }
        goodImageView = [[UIImageView alloc] initWithImage:[imgNameArr objectAtIndex:i]];
        [tileView addSubview:goodImageView];
           
           UILabel *titleName = [[UILabel alloc] initWithFrame:CGRectMake(0, goodImageView.image.size.height + 30, 251, 60)];
           titleName.backgroundColor = [UIColor clearColor];
           titleName.text = [title_name_arr objectAtIndex:i];
           titleName.textAlignment = NSTextAlignmentCenter;
           titleName.font = [UIFont fontWithName:@"HYc1gj" size:25];
           titleName.textColor = [UIColor blackColor];
           [tileView addSubview:titleName];
           
           UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, goodImageView.image.size.height + 30+70, 231, 100)];
           contentLabel.text = [desc_arr objectAtIndex:i];
           contentLabel.textColor = [UIColor blackColor];
           contentLabel.font = [UIFont fontWithName:@"HYc1gj" size:16];
           contentLabel.numberOfLines = 2;
           [tileView addSubview:contentLabel];

        
    }
    NSLog(@"%f",tileView.frame.origin.x);
    mScrollView.contentSize = CGSizeMake(tileView.frame.origin.x+251, 768);
    mScrollView.pagingEnabled = NO;
    if (num <4)
    {
        mScrollView.contentSize = CGSizeMake(1124, 768);
        mScrollView.pagingEnabled = YES;
    }
    
}

- (void)createMenuView
{
    menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 158, 768)];
    menuView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
   
    [self.view addSubview:menuView];
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    logoImageView.frame = CGRectMake(10, 20, logoImageView.image.size.width, logoImageView.image.size.height);
    [menuView addSubview:logoImageView];
    [logoImageView release];
    
    UIButton *clearButton = [[UIButton alloc] initWithFrame:CGRectMake(0, logoImageView.image.size.height+20+10, 158, 50)];
    [clearButton setTitle:@"清空缓存" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(cleanUp) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:clearButton];
}

//清空缓存
- (void)cleanUp
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"缓存提示"
                                                 message:@"你是否要清除缓存？"
                                                delegate:self
                                       cancelButtonTitle:@"确定"
                                       otherButtonTitles:@"取消",nil];
    [alert show];
}

//警告框delegate
- (void) alertView:(UIAlertView *) inAlertView clickedButtonAtIndex:(NSInteger) buttonIndex
{
	//看是哪个调用这个
	//缓存

		//确定
		if(buttonIndex==0)
		{
            [self showWithTime:@"清除中..."];
            [[EGOImageLoader sharedImageLoader] clearAllCache];
            //删除数据库数据
            [self performSelector:@selector(showCache) withObject:nil afterDelay:0.5];
		}
	

}

- (void)showWithTime:(NSString *)lable
{
    [HUD hide:YES];
    HUD = [[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = lable;
    [HUD showWhileExecutingT:@selector(myTaskT) onTarget:self withObject:nil animated:YES];
}
-(void)showCache
{
    [HUD hide:YES];
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:HUD];
	
	HUD.delegate = self;
	HUD.labelText = @"清除缓存成功";
	
	[HUD showWhileExecutingT:@selector(myTaskT) onTarget:self withObject:nil animated:YES];
}

- (void)myTaskT {
	sleep(1);
}

- (void)createMenuButton:(int)num
{
//    NSArray *buttonName = @[@"首页",@"企业文化",@"四大课程项目",@"会员套餐",@"消费单",@"专家介绍",@"研发中心",@"活动专区"];
    for (int i = 0; i < num; i++) {
        menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, i*60, 158, 50)];
        menuButton.backgroundColor = [UIColor clearColor];
        menuButton.tag = 100 +i;
        if (i == 0) {
            [menuButton setTitle:@"首页" forState:UIControlStateNormal];
        }
        else
        {
            CategoryDBItem *dbItem = [buttonName objectAtIndex:i-1];
            [menuButton setTitle:dbItem.catName forState:UIControlStateNormal];
        }
        
        [menuButton setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
        menuButton.titleLabel.font = [UIFont fontWithName:@"HYc1gj" size:21];
        [menuScrollView addSubview:menuButton];
        [menuButton addTarget:self action:@selector(menuTap:) forControlEvents:UIControlEventTouchUpInside];
        [menuButtonArray addObject:menuButton];
        if (i == 0) {
            tempButton = menuButton;
        }
//        if (i == 1)
//        {
//  
//            [menuButton setBackgroundImage:[UIImage imageNamed:@"menu_button_bg"] forState:UIControlStateNormal];
//            [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//            
//           
//        }
    }
    
     menuScrollView.contentSize = CGSizeMake(158, (num -1)*60+50);
}

- (void)menuTap:(UIButton *)btn
{
    if (tempButton != btn) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"menu_button_bg"] forState:UIControlStateNormal];
        [tempButton setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
        [tempButton setBackgroundImage:nil forState:UIControlStateNormal];
        tempButton = btn;
    }
    else
    {
        return;
    }
    
     if ([contentViewArray count]>0)
     {
         UIView *view = nil;
         for (view in contentViewArray) {
             [view removeFromSuperview];
//             [view release];

         }
         [contentViewArray removeAllObjects];
         
     }
    
    NSLog(@"%d",btn.tag -100);
    int Tag = btn.tag - 100;
    
    if (Tag == 0)
    {
        if (mScrollView == nil) {
            if (memberView != nil) {
                [memberView removeFromSuperview];
                [memberView release];
                memberView = nil;
            }
            [self.navigationController popToRootViewControllerAnimated:YES];
//            [self createScrollView];
//            [self createTileView:5];
//            [self.view bringSubviewToFront:menuView];
//            [self AnimationAction];
            
        }
        [self createSubMenuButton:0];
        
    }
    else
    {
        if (mScrollView != nil) {
            [mScrollView removeFromSuperview];
            [mScrollView release];
            mScrollView = nil;
        }
        
        if (Tag == 7 || Tag == 8) {
            if (memberView == nil) {
                memberView = [[MemberView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                [self.view addSubview:memberView];
                [self.view bringSubviewToFront:menuView];
            }
           
            [self AnimationAction];
        }
        
        [self createSubMenuButton:Tag];
       
    }
    

}

- (void)createSubMenuButton:(int)flag
{
    tempFlag_now = flag;
    if (tempFlag == flag||flag == 0 || flag == 7 || flag == 8)
    {
        tempFlag = flag;
        return;
    }
    else
    {
        [self AnimationAction];
        
       
        NSArray *targetArray = [sumArray objectAtIndex:flag-1];
        for (int i = 0; i<[targetArray count]; i++)
        {
            subButton = [[UIButton alloc] initWithFrame:CGRectMake(0, flag*60+55+25*0, 158, 20)];
            [menuScrollView addSubview:subButton];
            [submenuButtonArray addObject:subButton];
            subButton.tag = 100+i;
            [subButton release];
            [subButton setTitle:[targetArray objectAtIndex:i] forState:UIControlStateNormal];
            [subButton setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
            subButton.titleLabel.font = [UIFont fontWithName:@"HYc1gj" size:14.0];
            [subButton addTarget:self action:@selector(subMenuTap:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                tempSubButton = subButton;
                [subButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [subButton setBackgroundImage:[UIImage imageNamed:@"menu_button_bg"] forState:UIControlStateNormal];
                [self subMenuTap:subButton];
            }
            [UIView animateWithDuration:0.5 animations:^{
               
                    subButton.frame = CGRectMake(0, flag*60+55+25*i, 158, 20);
                
            }];
            
           
            
        }
        
        if ([targetArray count] == 0)
        {
            switch (tempFlag_now) {
                case 4:
                {
                    bigLoveView = [[BigLoveView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                    bigLoveView.backgroundColor = [UIColor whiteColor];
                    bigLoveView.DataDic = [pNameArr objectAtIndex:tempFlag_now-1];
                    [bigLoveView setLoveView:0];
                    [self.view addSubview:bigLoveView];
                    [self.view bringSubviewToFront:menuView];
                    [contentViewArray addObject:bigLoveView];
                    [bigLoveView release];
                }
                    break;
                case 5:
                {
                    heartView = [[HeartView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                    heartView.backgroundColor = [UIColor whiteColor];
                    heartView.dataDic = [pNameArr objectAtIndex:tempFlag_now-1];
                    [heartView expertIntro];
                    
                    [self.view addSubview:heartView];
                    [self.view bringSubviewToFront:menuView];
                    [contentViewArray addObject:heartView];
                    [heartView release];
                }
                    break;
                    
                 case 6:
                {
                    contactUsView = [[ContactUsView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                    contactUsView.backgroundColor = [UIColor whiteColor];
                    contactUsView.dataDic = [pNameArr objectAtIndex:tempFlag_now-1];
                    [contactUsView setContactView:0];
                    [self.view addSubview:contactUsView];
                    [self.view bringSubviewToFront:menuView];
                    [contentViewArray addObject:contactUsView];
                    [contactUsView release];
                }
                    break;
            }
        }
        
       offsetY = 25*[targetArray count];
        
        [UIView animateWithDuration:0.5 animations:^{
            for (int i = flag+1;i <= [sumArray count] ; i++) {
                UIButton *btn = [menuButtonArray objectAtIndex:i];
                btn.frame = CGRectMake(0, i*60+offsetY, 158, 50);
            }
        }];
        
        tempFlag = flag;
        menuScrollView.contentSize = CGSizeMake(158, 8*60+offsetY+50);
    }
   
    
}

- (void)subMenuTap:(UIButton *)btn
{

    
    int flagTag = btn.tag - 100;
    
    if (tempSubButton != btn) {
        [tempSubButton setTitleColor:[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"menu_button_bg"] forState:UIControlStateNormal];
        [tempSubButton setBackgroundImage:nil forState:UIControlStateNormal];
        tempSubButton = btn;
    }
    if ([contentViewArray count]>0) {
        [self.view bringSubviewToFront:[contentViewArray objectAtIndex:flagTag]];
        [self.view bringSubviewToFront:menuView];
        return;
    }
    
    NSArray *subArray = [sumArray objectAtIndex:tempFlag_now-1];
    for (int i = 0; i < [subArray count]; i++) {
        
        switch (tempFlag_now) {
            case 1:
            {
                contentView = [[ContentView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                contentView.backgroundColor = [UIColor whiteColor];
                contentView.DataArray = [subDataArr objectAtIndex:tempFlag_now-1];
                [contentView setView:i];
                [self.view addSubview:contentView];
                [contentViewArray addObject:contentView];
                [contentView release];
            }
                break;
            case 2:
            case 3:
            {
                courseView = [[CourseView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                courseView.flag = tempFlag_now;
                courseView.backgroundColor = [UIColor whiteColor];
                courseView.DataArray = [subDataArr objectAtIndex:tempFlag_now-1];
                courseView.largePicArray = courseLargeImgArr;
                courseView.vip_package_array = vipPackageImagArr;
                [courseView setCourseView:i];
                [self.view addSubview:courseView];
                [contentViewArray addObject:courseView];
                [courseView release];
            }
                break;
                
           
            case 4:
            {
                bigLoveView = [[BigLoveView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                bigLoveView.backgroundColor = [UIColor whiteColor];
                [bigLoveView setLoveView:i];
                [self.view addSubview:bigLoveView];
                [contentViewArray addObject:bigLoveView];
                [bigLoveView release];
            }
                
                break;
            case 5:
            {
                heartView = [[HeartView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                if (i == 0)
                {
                    heartView.backgroundColor = [UIColor whiteColor];
                    [heartView expertIntro];
                }
                
                [self.view addSubview:heartView];
                [contentViewArray addObject:heartView];
                [heartView release];
            }
                
                break;
            case 6:
            {
                contactUsView = [[ContactUsView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
                contactUsView.backgroundColor = [UIColor whiteColor];
                [contactUsView setContactView:i];
                [self.view addSubview:contactUsView];
                [contentViewArray addObject:contactUsView];
                [contactUsView release];
            }
                
                break;
        }
        
        
    }
    
    
    if ([contentViewArray count]>0) {
        [self.view bringSubviewToFront:[contentViewArray objectAtIndex:flagTag]];
        [self.view bringSubviewToFront:menuView];
    }

    
    
    
}

//还原主菜单按钮的位置
- (void)setButtonFrame
{
    for (int i = 0;i <= [sumArray count] ; i++) {
        UIButton *btn = [menuButtonArray objectAtIndex:i];
        btn.frame = CGRectMake(0, i*60, 158, 50);
    }
}

- (void)setViewLayer:(id)obj
{
    //实现原角
	[[obj layer] setBorderWidth:1.0];//画线的宽度
	[[obj layer] setBorderColor:[UIColor colorWithRed:211/255.0 green:211/255.0 blue:211/255.0 alpha:1].CGColor];//颜色
    //	[[obj layer] setCornerRadius:7];//圆角
    [obj setBackgroundColor:[UIColor whiteColor]];
    [[obj layer] setMasksToBounds:YES];
    
}

#pragma mark ScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.contentOffset.x > 158.0)
    {
        
        if (scrollView.contentOffset.x > offsetX)
        {
            [UIView animateWithDuration:0.5 animations:^{
                menuView.frame = CGRectMake(-158, 0, 158, 768);
            }];
        }
        else
        {
            [UIView animateWithDuration:0.5 animations:^{
                menuView.frame = CGRectMake(0, 0, 158, 768);
            }];
        }
        
        
        offsetX = scrollView.contentOffset.x;
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            menuView.frame = CGRectMake(0, 0, 158, 768);
        }];
    }
}



- (void)dealloc
{
    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [tempButton release];
    [menuButton release];
    [menuView release];
    [tileView release];
    [goodImageView release];
    [bgImageView release];
    
}

- (void)AnimationAction
{
    if ([submenuButtonArray count]>0) {
        for (UIButton *btn in submenuButtonArray) {
            [btn removeFromSuperview];
        }
        [submenuButtonArray removeAllObjects];
        
        
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(setButtonFrame)];
        [UIView commitAnimations];
    }
}

#pragma mark BaseView delegte
- (void)setMenuViewHidden:(NSNotification *)info
{
    BOOL hidden = [info.object boolValue];
    if (hidden) {
        [UIView animateWithDuration:0.5 animations:^{
            menuView.frame = CGRectMake(-158, 0, 158, 768);
        }];

    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            menuView.frame = CGRectMake(0, 0, 158, 768);
        }];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
