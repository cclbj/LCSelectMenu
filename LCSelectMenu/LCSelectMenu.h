//
//  LCSelectMenu.h
//  LCSelectMenu
//
//  Created by Lee on 15-10-3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LCSelectMenuProtocol <NSObject>

- (void)LCSelectMenuPageTouchUp:(UIView *)view andPage:(NSNumber *)page;


@end

@interface LCSelectMenu : UIScrollView

@property (nonatomic,strong) NSArray *menuTitleArray;

@property (nonatomic,strong) NSArray *menuItemViewArray;

@property (nonatomic,strong) id <LCSelectMenuProtocol>  lcDelegate;

+ (instancetype)selectMenu;

- (void)setMenuWith:(CGFloat)menuWidth andMenuHeight:(CGFloat)menuHeight;

- (void)setCurrentItemSelected:(int) currentPage;


@end
