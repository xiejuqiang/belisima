//
//  HomeViewController.m
//  YueZi
//
//  Created by Tang silence on 13-9-10.
//  Copyright (c) 2013年 Tang silence. All rights reserved.
//

#import "HomeViewController.h"
#import "OBShapedButton.h"
#import "RootViewController.h"

//获取网络数据相关
#import "JsonParser.h"
//url拼接相关
#import "UrlStr.h"

//数据库相关
#import "RecordDao.h"
#import "CategoryDBItem.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        [self initData];
        [self getData];
        
    }
    return self;
}
- (void)initData
{
    //url
    urlStr = [[UrlStr alloc]init];
    //网络获取数据
    jsonParser = [[JsonParser alloc]init];
    HUD = [[MBProgressHUD alloc] init];
    childArr = [[NSMutableArray alloc] init];
    recordDB = [[RecordDao alloc]init];
    [recordDB createDB:DATABASE_NAME];
    imgArray = [[NSArray alloc]initWithObjects:@"home_vippackage",@"home_course",@"home_expert",@"home_culture",@"home_belisima",@"home_R&Dcenter",@"home_activities", nil];
    rectArray = [[NSArray alloc]initWithObjects:
        [NSValue valueWithCGRect:CGRectMake(108.0, 118.0, 272.0, 272.0)],
        [NSValue valueWithCGRect:CGRectMake(380.0, 118.0, 272.0, 272.0)],
        [NSValue valueWithCGRect:CGRectMake(651.0, 118.0, 272.0, 272.0)],
        [NSValue valueWithCGRect:CGRectMake(244.0, 254.0, 272.0, 272.0)],
        [NSValue valueWithCGRect:CGRectMake(380.0, 254.0, 407.0, 407.0)],
        [NSValue valueWithCGRect:CGRectMake(108.0, 389.0, 272.0, 272.0)],
        [NSValue valueWithCGRect:CGRectMake(650.0, 389.0, 272.0, 272.0)],
    nil];
    classArray = @[@"BeilsViewController",@"ServiceViewController",@"PackageSystemViewController",@"HomeChildViewController",@"CallMViewController",@"BaseViewController",@"BaseViewController"];
    
   
}

- (void)getData
{
    NSArray *resultData = [recordDB resultSet:CATEGORY_TABLENAME Order:nil LimitCount:0];
    if ([resultData count]>0) {
        [self createView];
         NSString *sqlStr_child = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE parentId!=%@ Order By sortOrder,catId",CATEGORY_TABLENAME,@"0"];
        childArr = [[recordDB resultSetWhere:CATEGORY_TABLENAME Where:sqlStr_child] retain];
        return;
    }
    [self showWithLoding];
    NSString *menuCategoryURL = [urlStr returnURL:1];
    [jsonParser parse:menuCategoryURL withDelegate:self onComplete:@selector(connectionScrollSuccess:) onErrorComplete:@selector(connectionError) onNullComplete:@selector(connectionNull)];
}

- (void)connectionScrollSuccess:(JsonParser *)jsonP
{
    NSArray *returnDic = [[NSArray alloc] initWithArray:[jsonP getItems]];
    NSLog(@"%@",returnDic);
    parentArr = [[NSMutableArray alloc] init];
    childArr = [[NSMutableArray alloc] init];
    sumDataArr = [[NSMutableArray alloc] init];
    childPicArr = [[NSMutableArray alloc] init];
    vipPackageArr = [[NSMutableArray alloc] init];
    NSDictionary *dic = [returnDic objectAtIndex:0];
    NSDictionary *subDic = [dic objectForKey:@"menu"];
    NSLog(@"%@",subDic);
    
    int num =  [[subDic allKeys] count];
    
    for (int i = 1; i<=num; i++) {
        NSString *imgStr_content = nil;
        NSString *str = [[NSString alloc] initWithFormat:@"%d",i];
        NSLog(@"%@",[subDic objectForKey:str]);
        NSDictionary *subbDic = [subDic objectForKey:str];
        [sumDataArr addObject:subbDic];
        NSString *parentid = [subbDic objectForKey:@"parentid"];
        
       
        if ([[subbDic objectForKey:@"content"] isKindOfClass:[NSArray class]])
        {
            NSArray *imgArr = [subbDic objectForKey:@"content"];
            for (int k =0 ; k<[imgArr count]; k++) {
                NSString *imgStr = [imgArr objectAtIndex:k];
                if (imgStr_content != nil)
                {
                    imgStr_content = [[NSString alloc ] initWithFormat:@"%@,%@",imgStr_content,imgStr];
                }
                else
                {
                    imgStr_content = [[NSString alloc ] initWithFormat:@"%@",imgStr];
                }
                
                
            }

        }
        else
        {
            imgStr_content = @"";
        }
               NSLog(@"%@",imgStr_content);
        NSArray *categoryClosArray = [[NSArray alloc] initWithObjects:[subbDic objectForKey:@"id"],[subbDic objectForKey:@"cname"],[subbDic objectForKey:@"parentid"],[subbDic objectForKey:@"listorder"], imgStr_content,nil];
//        NSArray *categoryClosArray = @[[subbDic objectForKey:@"id"],[subbDic objectForKey:@"cname"],[subbDic objectForKey:@"parentid"],[subbDic objectForKey:@"listorder"]];
        [recordDB insertAtTable:CATEGORY_TABLENAME Clos:categoryClosArray];
        
        if ([parentid isEqualToString:@"0"])
        {
            [parentArr addObject:subbDic];
        }
        else
        {
            [childArr addObject:subbDic];
        }
    }
    
    for (NSDictionary *dic in childArr) {
        if ([[dic objectForKey:@"parentid"] isEqualToString:@"55"] || [[dic objectForKey:@"parentid"] isEqualToString:@"56"] || [[dic objectForKey:@"parentid"] isEqualToString:@"57"])
        {
        
            [childPicArr addObject:[dic objectForKey:@"content"]];
        }
        
        if ([[dic objectForKey:@"parentid"] isEqualToString:@"60"] || [[dic objectForKey:@"parentid"] isEqualToString:@"61"] || [[dic objectForKey:@"parentid"] isEqualToString:@"62"] || [[dic objectForKey:@"parentid"] isEqualToString:@"63"] || [[dic objectForKey:@"parentid"] isEqualToString:@"64"] || [[dic objectForKey:@"parentid"] isEqualToString:@"65"] || [[dic objectForKey:@"parentid"] isEqualToString:@"66"])
        {
            [vipPackageArr addObject:dic];
        }
    }
    
//    NSString *selectSql =[NSString stringWithFormat:@"SELECT * FROM %@ WHERE parentId=%@ Order By sortOrder,catId",CATEGORY_TABLENAME,@"0"];
//    parentArr = [recordDB resultSetWhere:CATEGORY_TABLENAME Where:selectSql];
    
    NSLog(@"%@",parentArr);
    [self getData];
    [HUD hide:YES];
}

- (void)connectionError
{
    [self showWithTime:@"网络连接出错，请检查网络！"];
}

- (void)connectionNull
{
    [self showWithTime:@"无内容！"];
}

- (void)createView
{
    UIImageView *imgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_bg"]];
    [self.view addSubview:imgV];
    [imgV release];
    UIImage *img = [UIImage imageNamed:@"home_logo"];
    UIImageView *logoV = [[UIImageView alloc]initWithImage:img];
    logoV.frame = CGRectMake(0, 768-50, img.size.width, img.size.height);
    [self.view addSubview:logoV];
    [logoV release];
    for (int i= 0;i<[imgArray count];i++) {
        OBShapedButton *beiLSBtn = [[OBShapedButton alloc]init];
        beiLSBtn.tag = 100 + i;
        [beiLSBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        if(i == 4)
           [beiLSBtn setEnabled:NO];
        [beiLSBtn setImage:[UIImage imageNamed:[imgArray objectAtIndex:i]] forState:UIControlStateNormal];
        beiLSBtn.frame = [[rectArray objectAtIndex:i] CGRectValue];
        [self.view addSubview:beiLSBtn];
    }
}
- (void)clickBtn:(OBShapedButton *)btn
{
    int index = btn.tag - 100;
    RootViewController *rootVC = [[RootViewController alloc] init];
    rootVC.parentArr = parentArr;
    rootVC.childArr = childArr;
    rootVC.sumDataArr = sumDataArr;
    rootVC.childPicArr = childPicArr;
    rootVC.vipPackageArr = vipPackageArr;
    switch (index) {
        case 0:
            rootVC.viewIndex = 3;
            break;
            
        case 1:
            rootVC.viewIndex = 2;
            break;
        case 2:
            rootVC.viewIndex = 5;
            break;
        case 3:
            rootVC.viewIndex = 1;
            break;
        case 5:
            rootVC.viewIndex = 6;
            break;
        case 6:
            rootVC.viewIndex = 7;
            break;
    }
   
    [self.navigationController pushViewController:rootVC animated:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self.view];
    
    NSLog(@"%f==%f",touchPoint.x,touchPoint.y);
    int stringFloat = (int)(touchPoint.x);
    int stringFloat1 = (int)(touchPoint.y);
    NSLog(@"%i  %i",stringFloat,stringFloat1);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imgBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg"]];
    [self.view addSubview:imgBG];
	// Do any additional setup after loading the view.
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

#pragma mark showHud

- (void)showWithTime:(NSString *)lable
{
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = lable;
    [HUD showWhileExecutingT:@selector(myTask) onTarget:self withObject:nil animated:YES];
}
- (void)showWithLoding
{
    [self.view addSubview:HUD];
    HUD.delegate = self;
    HUD.labelText = @"加载中...";
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (void)myTask {
	// Do something usefull in here instead of sleeping ...
    sleep(1);
}

@end
