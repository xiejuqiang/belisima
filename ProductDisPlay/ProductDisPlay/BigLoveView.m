//
//  BigLoveView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BigLoveView.h"
#import "Constant.h"
#import "EGOImageView.h"
@implementation BigLoveView
@synthesize DataDic;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setLoveView:(int)num
{
    switch (num) {
        case 0:
            [self customList];
            break;
            
        case 1:
            [self love2];
            break;
    }
}

- (void)customList
{
    
    
    NSDictionary *dicData = self.DataDic;
    NSArray *urlArray = [dicData objectForKey:@"content"];
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[urlArray objectAtIndex:0]];
    EGOImageView *imgView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
    imgView.isUse = NO;
    imgView.imageURL = [[NSURL alloc] initWithString:urlStr];
    [self addSubview:imgView];
    [imgView release];
//    self.imgIndex = [dicData objectForKey:@"id"];
//    self.imgURLStr = urlStr;
    
}

- (void)love2
{
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brandstory"]];
    [self addSubview:imgView];
    imgView.frame = CGRectMake((self.bounds.size.width-750)/2.0, 50, 750, 300);
    UIFont *font = [UIFont fontWithName:@"HYc1gj" size:18];
    NSString *str = @"1.韩经能量背部疏通课程主题词：内调外促，修炼健康强女人时间            50min价格            380元功效            快速瘦身排毒，滋润脏腑，改善体质原理解析        根据韩国传统经络学说，用特殊手法推动韩经治疗仪输入人体内的能量，对人体经脉进行疏通，温养脏腑，改善体内血气循环和代谢功能，分解排除体内淤积的毒素和脂肪";
    CGSize labelSize =  [self autoWidthHeight:str fontSize:font width:750];
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.frame.origin.x, 380, 750, labelSize.height)];
    [self addSubview:contentLabel];
    contentLabel.text = str;
    contentLabel.font = font;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.numberOfLines = 0;
    [contentLabel release];
}


- (CGSize)autoWidthHeight:(NSString *)str fontSize:(UIFont *)font width:(float)width
{
    
    NSString *s =str ;
    UIFont *fontsize = font;
    CGSize size = CGSizeMake(width,2000);
    CGSize labelsize = [s sizeWithFont:fontsize constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
    return labelsize;
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
