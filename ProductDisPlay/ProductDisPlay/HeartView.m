//
//  HeartView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "HeartView.h"
#import "EGOImageView.h"
#import "Constant.h"
#import "CategoryDBItem.h"
@implementation HeartView
@synthesize dataDic;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)expertIntro
{
    CategoryDBItem *dic = self.dataDic;
    NSArray *contentArr = [dic.content componentsSeparatedByString:@","];
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
    EGOImageView *imgView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
    imgView.isUse = NO;
    imgView.imageURL = [[NSURL alloc] initWithString:urlStr];
    [self addSubview:imgView];
    [imgView release];
//    NSDictionary *dic = self.dataDic;
//    self.imgIndex = [dic objectForKey:@"id"];
//    NSArray *contentArr = [dic objectForKey:@"content"];
//    self.imgURLStr = [[NSString alloc] initWithFormat:@"%@%@",Default_URL,[contentArr objectAtIndex:0]];
    
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
