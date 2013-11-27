//
//  CourseView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "CourseView.h"
#import "Constant.h"
#import "EMAsyncImageView.h"
#import "EGOImageView.h"
#import "CategoryDBItem.h"
@implementation CourseView
@synthesize flag;
@synthesize DataArray;
@synthesize mSV;
@synthesize largePicArray,vip_package_array;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        imageNameArr = @[@"vip_22800.jpg",@"vip_49800.jpg",@"vip_99800.jpg",@"vip_199800.jpg",@"vip_380000.jpg"];
        imageNameArr1 = @[@"course_curve.jpg",@"course_weight.jpg"];
        
        buttonArr = [[NSArray alloc]initWithObjects:[NSValue valueWithCGRect:CGRectMake(40, 85, 350, 330)],
                                                    [NSValue valueWithCGRect:CGRectMake(40, 427.5, 400, 300)],
                                                    [NSValue valueWithCGRect:CGRectMake(397.5, 85, 585, 330)],
                                                    [NSValue valueWithCGRect:CGRectMake(455, 427.5, 530, 300)],
                                                    [NSValue valueWithCGRect:CGRectMake(1024+40, 85, 350, 330)],
                                                    [NSValue valueWithCGRect:CGRectMake(1024+40, 430, 490, 175.5)],
                                                    [NSValue valueWithCGRect:CGRectMake(1024+40, 600, 490, 125.5)],
                                                    [NSValue valueWithCGRect:CGRectMake(1024+400, 85, 585, 330)],
                                                    [NSValue valueWithCGRect:CGRectMake(1024+540, 430, 490, 300)],nil];
        
        buttonArr1 = [[NSArray alloc]initWithObjects:[NSValue valueWithCGRect:CGRectMake(40, 85, 490, 330)],
                      [NSValue valueWithCGRect:CGRectMake(40, 425, 490, 300)],
                      [NSValue valueWithCGRect:CGRectMake(542.5, 85, 450, 330)],
                      [NSValue valueWithCGRect:CGRectMake(542.5, 425, 450, 300)],nil];
        
        buttonArr2 = [[NSArray alloc]initWithObjects:[NSValue valueWithCGRect:CGRectMake(40, 85, 942.5, 335)],
                      [NSValue valueWithCGRect:CGRectMake(40, 425, 942.5, 300)],nil];
        

    }
    return self;
}

- (void)setCourseView:(int)num
{

    dicData = [self.DataArray objectAtIndex:num];
    switch (num) {
        case 0:
            [self course1];
            break;
            
        case 1:
            [self course2];
            break;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            [self course3:num];
            break;
       
    }
}

- (void)course1
{
    if (self.flag == 2)
    {
        UIScrollView *mScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        mScrollView.contentSize = CGSizeMake(1024*2, 768);
        [self addSubview:mScrollView];

        NSArray *contentArr = [dicData.content componentsSeparatedByString:@","];
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:1]];
        NSString *urlStr1 = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
        EGOImageView *imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg"]];
        imageView.isUse = NO;
        imageView.userInteractionEnabled = YES;
        imageView.imageURL = [[NSURL alloc] initWithString:urlStr];
        
        EGOImageView *imageView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg"]];
        imageView1.userInteractionEnabled = YES;
        imageView1.isUse = NO;
        imageView1.imageURL = [[NSURL alloc] initWithString:urlStr1];
        imageView1.frame = CGRectMake(1024, 0, 1024, 768);
        
        [mScrollView addSubview:imageView];
        [mScrollView addSubview:imageView1];
        
        NSArray *large_img = [[largePicArray objectAtIndex:0] retain];
        
        for (int i = 0; i < [large_img count]; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = [[buttonArr objectAtIndex:i] CGRectValue];
            button.tag = 100 +i;
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [mScrollView addSubview:button];
            [button release];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        [imageView addGestureRecognizer:tap];
        [imageView1 addGestureRecognizer:tap1];
        [tap release];
        [tap1 release];
        
        [imageView release];
        [imageView1 release];
        [mScrollView release];
        [buttonArr release];
    }
    else
    {
        
        NSArray *buttonFrameArr = [[NSArray alloc]initWithObjects:[NSValue valueWithCGRect:CGRectMake(240, 102.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 153.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 203.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 253.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 303.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 353.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 403.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 453.5, 697.5, 49)],
                                   [NSValue valueWithCGRect:CGRectMake(240, 503.5, 697.5, 49)],nil];
        UIImageView *imgBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg.png"]];
        [self addSubview:imgBG];
        EGOImageView *imgView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
        imgView1.isUse = YES;
        NSArray *contentArr = [dicData.content componentsSeparatedByString:@","];
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
        imgView1.imageURL = [[NSURL alloc] initWithString:urlStr];
        imgView1.frame = CGRectMake((1024 -imgView1.image.size.width)/2.0 , 0, imgView1.image.size.width, imgView1.image.size.height);
        [self addSubview:imgView1];
        imgView1.userInteractionEnabled = YES;
        [imgView1 release];
        
        for (int i = 0; i< 9; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = [[buttonFrameArr objectAtIndex:i] CGRectValue];
            button.tag = 100+i;
//            if (i != 0 && i != 1 && i != 6 && i != 7 && i != 8 && i != 10) {
//                button.enabled = NO;
//            }
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button release];
            
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        [imgView1 addGestureRecognizer:tap];
        [tap release];
        [buttonFrameArr release];
        
    }
    
    
    
}

- (void)pressButton:(UIButton *)btn
{
    
    
    if (thumbView != nil) {
        
        return;
    }
    int Flag = 0;
    NSString *picName =nil;
    isHidden = NO;
    if (self.flag == 2) {
        if (btn.tag < 200) {
            Flag = btn.tag - 100;
            NSArray *imgUrlArray = [largePicArray objectAtIndex:0];
            int imgCount = [imgUrlArray count]-1;
            if ((imgCount - Flag)>-1)
            {
                picName = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[imgUrlArray objectAtIndex:imgCount-Flag]];
            }
            else
            {
                picName = @"";
            }
            
        }
        
        if (btn.tag >= 200 && btn.tag < 300) {
            Flag = btn.tag - 200;
            NSArray *imgUrlArray = [largePicArray objectAtIndex:1];
            int imgCount = [imgUrlArray count]-1;
            if ((imgCount - Flag)>-1)
            {
                picName = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[imgUrlArray objectAtIndex:imgCount-Flag]];
            }
            else
            {
                picName = @"";
            }
        }
        else if (btn.tag>=300)
        {
            Flag = btn.tag - 300;
            NSArray *imgUrlArray = [largePicArray objectAtIndex:2];
            int imgCount = [imgUrlArray count]-1;
            if ((imgCount - Flag)>-1)
            {
                picName = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[imgUrlArray objectAtIndex:imgCount-Flag]];
            }
            else
            {
                picName = @"";
            }
        }
    }
    else
    {
        switch (btn.tag/100) {
            case 1:
            {
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"61"]) {
                       
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                        
                    
                    }
                }
                Flag = btn.tag - 100;
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];
            }
                
                break;
            case 2:
            {
                Flag = btn.tag - 200;
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"60"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];

                
            }
                
                break;
            case 3:
            {
                Flag = btn.tag - 300;
                
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"62"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];

                
            }
                
                break;
            case 4:
            {
                Flag = btn.tag - 400;
                
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"63"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];

                
            }
                
                break;
            case 5:
                
            {
                Flag = btn.tag - 500;
                
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"64"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                
                    picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];
            }
                
                break;
            case 6:
            {
                Flag = btn.tag - 600;
                
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"65"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];

                
            }
                
                break;
                
            case 7:
            {
                Flag = btn.tag - 700;
                NSMutableArray *imgArray = [[NSMutableArray alloc] init];
                for (CategoryDBItem *dic in vip_package_array) {
                    if ([dic.parentId isEqualToString:@"66"]) {
                        [imgArray addObject:[dic.content componentsSeparatedByString:@","]];
                    }
                }
                NSString *imgUrl = @"";
                if (Flag<([imgArray count])) {
                    if ([[imgArray objectAtIndex:Flag] isKindOfClass:[NSString class]] == NO) {
                        imgUrl = [[imgArray objectAtIndex:Flag] objectAtIndex:0];
                        
                    }
                }
                picName =[[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgUrl];

                
            }
                
                break;
        }
    }
    
    
    thumbView = [[UIView alloc] initWithFrame:self.bounds];
    thumbView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self addSubview:thumbView];
    
//    UIImage *img = [UIImage imageNamed:picName];
    bigPicView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
    bigPicView.isUse = NO;
    bigPicView.imageURL = [[NSURL alloc] initWithString:picName];
    bigPicView.frame = CGRectMake((self.frame.size.width-507)/2.0, (self.frame.size.height-507)/2.0, 0, 0);
    bigPicView.userInteractionEnabled = YES;
    [thumbView addSubview:bigPicView];
    
    if (self.flag == 2)
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            bigPicView.frame = CGRectMake((self.frame.size.width-507)/2.0, (self.frame.size.height-507)/2.0, 507, 507);
            
        }];
    }
    else
    {
        [UIView animateWithDuration:0.5 animations:^{
            
            bigPicView.frame = CGRectMake((self.frame.size.width-bigPicView.image.size.width)/2.0, (self.frame.size.height-414)/2.0, bigPicView.image.size.width, 414);
            
        }];
    }
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeView)];
    [thumbView addGestureRecognizer:tap];
    
    
    [bigPicView release];
    [tap release];
    [self closeMenuView];
    
}

- (void)closeView
{
    isHidden = YES;
    [self closeMenuView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeThumbView)];
    bigPicView.frame = CGRectMake((self.frame.size.width-507)/2.0, (self.frame.size.height-507)/2.0, 0, 0);
//    thumbView.frame = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
    
    
    
}

- (void)removeThumbView
{
    
    [thumbView removeFromSuperview];
    [thumbView release];
    thumbView = nil;
}

- (void)course2
{
    if (self.flag == 2)
    {
//        EMAsyncImageView *imgView = [[EMAsyncImageView alloc] initWithFrame:self.frame];
//        imgView.imgIndex = [dicData objectForKey:@"id"];
//        NSString *urlStr = [[dicData objectForKey:@"content"] objectAtIndex:0];
//        imgView.imageUrl = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,urlStr];
//        [self addSubview:imgView];
        
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[[dicData.content componentsSeparatedByString:@","] objectAtIndex:0]];
        EGOImageView *imgView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg"]];
        imgView.isUse = NO;
        imgView.imageURL = [[NSURL alloc] initWithString:urlStr];
        [self addSubview:imgView];
        for (int i = 0; i< 4; i++) {
            UIButton *button = [[UIButton alloc]init];
            button.frame = [[buttonArr1 objectAtIndex:i] CGRectValue];
            button.tag = 200 +i;
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button release];
        }
        [buttonArr1 release];
        [imgView release];
    }
    else
    {
        NSArray *buttonFrameArr = [[NSArray alloc]initWithObjects:[NSValue valueWithCGRect:CGRectMake(240, 102.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 153.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 203.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 253.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 303.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 353.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 403.5, 697.5, 69)],
         [NSValue valueWithCGRect:CGRectMake(240, 473.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 523.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 573.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 623.5, 697.5, 49)],
         [NSValue valueWithCGRect:CGRectMake(240, 673.5, 697.5, 49)],nil];
        
        UIImageView *imgBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg.png"]];
        [self addSubview:imgBG];
        
        EGOImageView *imgView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg"]];

        NSArray *contentArr = [dicData.content componentsSeparatedByString:@","];
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
        imgView1.imageURL = [[NSURL alloc] initWithString:urlStr];
        imgView1.frame = CGRectMake((1024 -imgView1.image.size.width)/2.0, 0, imgView1.image.size.width, imgView1.image.size.height);
        [self addSubview:imgView1];
        imgView1.userInteractionEnabled = YES;
        [imgView1 release];
        
        for (int i = 0; i< 12; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = [[buttonFrameArr objectAtIndex:i] CGRectValue];
            button.tag = 200+i;
//            if (i != 0 && i != 1 && i != 2 && i != 7) {
//                button.enabled = NO;
//            }
            [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button release];
            
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        [imgView1 addGestureRecognizer:tap];
        [tap release];
        [buttonFrameArr release];
    }
    
    
}

- (void)course3:(int)index
{
    if (self.flag == 2)
    {
        
        NSString *imgStr = [[dicData.content componentsSeparatedByString:@","] objectAtIndex:0];
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgStr];
//        EMAsyncImageView *imgView = [[EMAsyncImageView alloc] initWithFrame:self.frame];
//        imgView.imgIndex = [dicData objectForKey:@"id"];
//        imgView.imageUrl = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,imgStr];
        EGOImageView *imgView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg"]];
        imgView.isUse = NO;
        imgView.imageURL = [[NSURL alloc] initWithString:urlStr];
        [self addSubview:imgView];
        if (index != 3) {
            for (int i = 0; i< 2; i++) {
                UIButton *button = [[UIButton alloc]init];
                button.frame = [[buttonArr2 objectAtIndex:i] CGRectValue];
                button.tag = 300 +i;
                [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:button];
                [button release];
            }
        }
        else
        {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
            [self addGestureRecognizer:tap];
            [tap release];
        }
        
        [buttonArr2 release];
        [imgView release];
    }
    else
    {
        
        
        UIImageView *imgBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bg.png"]];
        [self addSubview:imgBG];
        
        mSV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
        mSV.backgroundColor = [UIColor clearColor];
        [self addSubview:mSV];
        
        EGOImageView *imgView1 = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
        imgView1.viewFlage = self;
        imgView1.isUse = YES;
        NSArray *contentArr = [dicData.content componentsSeparatedByString:@","];
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
        imgView1.imageURL = [[NSURL alloc] initWithString:urlStr];
        imgView1.frame = CGRectMake((1024 -imgView1.image.size.width)/2.0, 0, imgView1.image.size.width, imgView1.image.size.height);
        [mSV addSubview:imgView1];
        imgView1.userInteractionEnabled = YES;
        mSV.contentSize = CGSizeMake(1024, imgView1.frame.size.height);
        
        switch (index) {
            case 2:
                for (int i = 0; i< 15; i++) {
                    UIButton *button = [[UIButton alloc] init];
                    button.frame = CGRectMake(240, 102.5+50*i, 697.5, 49);
                    if (i>7) {
                        button.frame = CGRectMake(240, 122.5+50*i, 697.5, 49);
                    }
                    button.tag = 300+i;
//                    if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 9) {
//                        button.enabled = NO;
//                    }
                    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                    [mSV addSubview:button];
                    [button release];
                    
                }
                break;
            case 3:
                for (int i = 0; i< 21; i++) {
                    UIButton *button = [[UIButton alloc] init];
                    button.frame = CGRectMake(240, 102.5+50*i, 697.5, 49);
                    if (i>7) {
                        button.frame = CGRectMake(240, 122.5+50*i, 697.5, 49);
                    }
                    button.tag = 400+i;
//                    if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 10 || i == 11 || i == 13 || i == 18 || i == 20) {
//                        button.enabled = NO;
//                    }
                    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                    [mSV addSubview:button];
                    [button release];
                    
                }
                break;
            case 4:
                for (int i = 0; i< 24; i++) {
                    UIButton *button = [[UIButton alloc] init];
                    button.frame = CGRectMake(240, 102.5+50*i, 697.5, 49);
                    if (i>7) {
                        button.frame = CGRectMake(240, 122.5+50*i, 697.5, 49);
                    }
                    button.tag = 500+i;
//                    if (i == 3 || i == 4 || i == 5 || i == 6 || i == 8 || i == 11 || i == 19 || i == 21 || i == 22) {
//                        button.enabled = NO;
//                    }
                    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                    [mSV addSubview:button];
                    [button release];
                    
                }
                break;
            case 5:
                for (int i = 0; i< 25; i++) {
                    UIButton *button = [[UIButton alloc] init];
                    button.frame = CGRectMake(240, 102.5+50*i, 697.5, 49);
                    if (i>7) {
                        button.frame = CGRectMake(240, 122.5+50*i, 697.5, 49);
                    }
                    
//                    if (i != 0 && i != 1 && i != 2 && i != 7 && i != 9 && i != 12 && i != 15 && i != 17 && i != 18 && i != 24) {
//                        button.enabled = NO;
//                    }
                    
                    button.tag = 600+i;
                    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                    [mSV addSubview:button];
                    [button release];
                    
                }
                break;
                
            case 6:
                for (int i = 0; i< 28; i++) {
                    UIButton *button = [[UIButton alloc] init];
                    button.frame = CGRectMake(240, 102.5+50*i, 697.5, 49);
                    if (i>7) {
                        button.frame = CGRectMake(240, 122.5+50*i, 697.5, 49);
                    }
                    button.tag = 700+i;
//                    if (i != 0 && i != 1 && i != 2 && i != 7 && i != 9 && i != 12 && i != 15 && i != 17 && i != 18 && i != 24 && i != 26 && i != 27 ) {
//                        button.enabled = NO;
//                    }
                    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
                    [mSV addSubview:button];
                    [button release];
                    
                }
                break;
                
            default:
                break;
        }
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        [imgView1 addGestureRecognizer:tap];
        
        [imgView1 release];
        [tap release];
        [mSV release];
    }
    
    
}



- (void)closeMenuView
{
    isHidden = !isHidden;
    NSNumber *boolNumber = [NSNumber numberWithBool:isHidden];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"setMenuViewHidden" object:boolNumber];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"AAAA");
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
