//
//  LCPageContentScrollView.h
//  LCSelectMenu
//
//  Created by Lee on 15-10-4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCPageContentScrollView : UIScrollView

@property (nonatomic,strong) NSArray *pageViewArray;

+ (instancetype)pageContentScrollView;

@end
