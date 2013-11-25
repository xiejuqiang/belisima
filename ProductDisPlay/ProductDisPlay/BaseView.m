//
//  BaseView.m
//  ProductDisPlay
//
//  Created by apple on 13-9-26.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseView.h"
#import "EMAsyncImageView.h"
@implementation BaseView
@synthesize EMImageView;
@synthesize imgURLStr,imgIndex;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        isHidden = NO;
        [self createEMImageView];
        
    }
    return self;
}

- (void)createEMImageView
{
    EMImageView = [[EMAsyncImageView alloc] initWithFrame:self.frame];
    EMImageView.userInteractionEnabled = YES;
    [self addSubview:EMImageView];
}



- (void)setImgURLStr:(NSString *)url
{
    EMImageView.imageUrl = url;
}

- (void)setImgIndex:(NSString *)index
{
    EMImageView.imgIndex = index;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"HHHHH");
    
    
    
    isHidden = !isHidden;
    NSNumber *boolNumber = [NSNumber numberWithBool:isHidden];
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"setMenuViewHidden" object:boolNumber];
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
