//
//  ContentView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-11.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ContentView.h"
#import "EGOImageView.h"
#import "EMAsyncImageView.h"
#import "Constant.h"
#import "CategoryDBItem.h"
@implementation ContentView
@synthesize DataArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        
    }
    return self;
}

- (void)setView:(int)num
{
    dicData = [self.DataArray objectAtIndex:num];
    
    switch (num) {
        case 0:
        {
            
            [self brandStory];
            
        }
            break;
        case 1:
        {
            
            urlStrArray = [[dicData.content componentsSeparatedByString:@","] retain];
            
            [self createTheClubPic:[urlStrArray count]];
        }
            break;
       
        
    }
}



- (void)brandStory
{
    EGOImageView *imagView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
   
    NSLog(@"%@",dicData.content);
    NSArray *urlArray = [dicData.content componentsSeparatedByString:@","];
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[urlArray objectAtIndex:0]];
    imgView.isUse = NO;
    imagView.userInteractionEnabled = YES;
    imagView.imageURL = [[NSURL alloc] initWithString:urlStr];
    [self addSubview:imagView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
    [imagView addGestureRecognizer:tap];
    

}

- (void)closeMenuView
{
    isHidden = !isHidden;
    NSNumber *boolNumber = [NSNumber numberWithBool:isHidden];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"setMenuViewHidden" object:boolNumber];
}



- (void)createTheClubPic:(int)num
{
    
    mScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:mScrollView];
    mScrollView.delegate = self;
    mScrollView.bounces = YES;
    [mScrollView release];
    
    int drow = 0;
    int dcol = 0;
    int offsetX = 0;
    NSArray *imgUrlArr = urlStrArray;
    
    for(int i = 0;i<num;i++)
    {
        drow = i%3;
        dcol = i/3;
        
        imgView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
        imgView.isUse = NO;
        [mScrollView addSubview:imgView];
        imgView.userInteractionEnabled = YES;
        NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[imgUrlArr objectAtIndex:i]];
        imgView.imageURL = [[NSURL alloc] initWithString:urlStr];
        imgView.frame = CGRectMake(dcol*288, 256*drow, 288, 256);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTap:)];
        [imgView addGestureRecognizer:tap];
        tap.view.tag = 200 + i;
        [imgView release];
        [tap release];
        
        
//        EMAImageView = [[EMAsyncImageView alloc] initWithFrame:CGRectMake(dcol*288, 256*drow, 288, 256)];
//        [mScrollView addSubview:EMAImageView];
//        EMAImageView.userInteractionEnabled = YES;
//        EMAImageView.imgIndex = [[NSString alloc] initWithFormat:@"%d",i+200];
//        EMAImageView.imageUrl = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[imgUrlArr objectAtIndex:i]];
//        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTap:)];
//        [EMAImageView addGestureRecognizer:tap];
//        tap.view.tag = 200 + i;
//        [EMAImageView release];
//        [tap release];
        
    }
//    offsetX = EMAImageView.frame.origin.x+288;
    offsetX = imgView.frame.origin.x + 288;
    mScrollView.contentSize = CGSizeMake(offsetX, 768);
    
    
}


- (void)picTap:(UIGestureRecognizer *)btn
{
    if (thumbView != nil) {
        return;
    }
    int flag = btn.view.tag - 200;
    NSLog(@"%d",flag);
    
//    NSString *file_name = [[NSString alloc] initWithFormat:@"%d.jpg",flag];
//    NSString *imageCachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *filePath = [imageCachePath stringByAppendingPathComponent:file_name];
    
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[urlStrArray objectAtIndex:flag]];
    NSString* cachesDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *imagePath1 = [[[[cachesDirectory stringByAppendingPathComponent:[[NSProcessInfo processInfo] processName]] stringByAppendingPathComponent:@"EGOCache"] copy] stringByAppendingPathComponent:[NSString stringWithFormat:@"EGOImageLoader-%u", [[imagePath description] hash]]];
    
//    NSString *picName =[[NSString alloc] initWithFormat:@"club_d%d.png",flag+1];
    thumbView = [[UIView alloc] initWithFrame:self.bounds];
    thumbView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self addSubview:thumbView];
    
    bigPicView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width-576)/2.0, (self.frame.size.height-512)/2.0, 0, 0)];
//    bigPicView.image = [UIImage imageNamed:picName];
    bigPicView.image = [UIImage imageWithContentsOfFile:imagePath1];
    [thumbView addSubview:bigPicView];
    
    [UIView animateWithDuration:0.5 animations:^{
        
        bigPicView.frame = CGRectMake((self.frame.size.width-576)/2.0, (self.frame.size.height-512)/2.0, 576, 512);
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeView)];
    [thumbView addGestureRecognizer:tap];
    
    
    [bigPicView release];
    [tap release];
    [self closeMenuView];
}

- (void)closeView
{
    [self closeMenuView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(removeThumbView)];
    bigPicView.frame = CGRectMake((self.frame.size.width-576)/2.0, (self.frame.size.height-512)/2.0, 0, 0);
    thumbView.frame = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
        
    
    
}

- (void)removeThumbView
{
    
    [thumbView removeFromSuperview];
    [thumbView release];
    thumbView = nil;
}

- (CGSize)autoWidthHeight:(NSString *)str fontSize:(UIFont *)font width:(float)width
{
    
    NSString *s =str ;
    UIFont *fontsize = font;
    CGSize size = CGSizeMake(width,2000);
    CGSize labelsize = [s sizeWithFont:fontsize constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    return labelsize;
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
