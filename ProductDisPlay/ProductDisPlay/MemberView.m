//
//  MemberView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-12.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "MemberView.h"
#import "EGOImageView.h"

@implementation MemberView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = [UIColor whiteColor];
    UIImage *img = [UIImage imageNamed:@"home_bg.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.frame = CGRectMake((self.bounds.size.width-img.size.width)/2.0, (self.bounds.size.height - img.size.height)/2.0, img.size.width, img.size.height);
    [self addSubview:imageView];
    
//    EGOImageView *imageView = [[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"home_bg.png"]];
//    imageView.isUse = NO;
//    imageView.imageURL = [[NSURL alloc] initWithString:@"http://b.hiphotos.baidu.com/album/w%3D1024%3Bcrop%3D0%2C0%2C1024%2C768/sign=ab65b8ef0dd79123e0e090749f0062e1/08f790529822720e6d160a1d7acb0a46f31fab79.jpg"];
    
    [self addSubview:imageView];
    
//    [imgView release];
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
