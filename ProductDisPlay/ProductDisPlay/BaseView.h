//
//  BaseView.h
//  ProductDisPlay
//
//  Created by apple on 13-9-26.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@class EMAsyncImageView;
@interface BaseView : UIView
{
   BOOL isHidden;
}

@property (nonatomic,retain)EMAsyncImageView *EMImageView;
@property (nonatomic,retain)NSString *imgURLStr;
@property (nonatomic,retain)NSString *imgIndex;



@end
