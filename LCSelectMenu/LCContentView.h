//
//  LCContentView.h
//  LCSelectMenu
//
//  Created by Lee on 15-10-4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCContentView : UIView

@property (nonatomic,strong) NSArray *menuTitleArray;

@property (nonatomic,strong) NSArray *pageViewArray;

+ (instancetype)contentView;

@end
