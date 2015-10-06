//
//  LCSelectMenu.m
//  LCSelectMenu
//
//  Created by Lee on 15-10-3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "LCSelectMenu.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width;

#define ScreenHeight [UIScreen mainScreen].bounds.size.height;

@interface LCSelectMenu ()

@property (nonatomic,assign) CGFloat menuWidth;

@property (nonatomic,assign) CGFloat menuHeight;

@property (nonatomic,assign) BOOL isChangeMenuOption;

@property (nonatomic,strong) NSMutableArray *btnItemArray;

@property (nonatomic,weak) UIScrollView *contentView;

@property (nonatomic,weak) UIView *bottomBar;

@end

@implementation LCSelectMenu

+ (instancetype)selectMenu{
    
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        
        //如果用户未设置属性，则给出默认值即可
        if (self.isChangeMenuOption==NO) {
            NSLog(@"width:%f",frame.size.width);
            self.menuWidth = frame.size.width/2.0;
            self.menuHeight = 44;
        }
        
    }
    
    return self;
}

#pragma mark 设置主视图目录界面

-(void)setMenuTitleArray:(NSArray *)menuTitleArray{

    _menuTitleArray = menuTitleArray;
    
    _btnItemArray = [[NSMutableArray alloc]init];
    
    NSLog(@"setMenuItem...");
    
    if (self.isChangeMenuOption==NO) {
        _menuWidth = self.frame.size.width/2;
        _menuHeight = self.frame.size.height;
    }
    //创建子控件
    for (int i=0; i<self.menuTitleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*self.menuWidth, 0, self.menuWidth, self.menuHeight-2);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:self.menuTitleArray[i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(menuItemTouch:) forControlEvents:UIControlEventTouchUpInside];
        [_btnItemArray addObject:button];
        [self addSubview:button];
    }
    
    //创建菜单栏下面的显示条
    UIView *menuBar = [[UIView alloc]initWithFrame:CGRectMake(10, self.menuHeight-2, self.menuWidth-20, 2)];
    [self addSubview:menuBar];
    [menuBar setBackgroundColor:[UIColor blueColor]];
    self.bottomBar = menuBar;
    
    self.contentSize = CGSizeMake(menuTitleArray.count*self.frame.size.width, self.frame.size.height);
    
    //设置scrollView 的相关属性
    self.userInteractionEnabled = YES;
//    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
}

- (void)menuItemTouch:(UIButton *)btn{
    
    NSLog(@"btuTouch>>>");
    CGFloat btnX = btn.frame.origin.x;

    //改变底部状态条的位置
    [UIView animateWithDuration:0.1 animations:^{
        self.bottomBar.transform = CGAffineTransformMakeTranslation(btnX, 0);
    }];
    
    NSNumber *numberPage = [NSNumber numberWithInteger:btn.tag];
    [self.lcDelegate LCSelectMenuPageTouchUp:self andPage:numberPage];

}


- (void)setMenuWidth:(CGFloat)menuWidth{

    _menuWidth = menuWidth;
    
    if (_menuWidth == 0) {
        _menuWidth = self.frame.size.width/2;
    }
    
}

- (void)setMenuWith:(CGFloat)menuWidth andMenuHeight:(CGFloat)menuHeight{
    
    self.isChangeMenuOption = YES;
    
    self.menuWidth = menuWidth;
    self.menuHeight = menuHeight;
}


- (void)setMenuHeight:(CGFloat)menuHeight{

    _menuHeight = menuHeight;
    if (_menuHeight == 0) {
        _menuHeight = self.frame.size.height;
    }
    
}

- (void)setCurrentItemSelected:(int) currentPage{
    
    int page = currentPage*_menuWidth/self.frame.size.width;
    
    self.contentOffset = CGPointMake(page*self.frame.size.width, 0);
    

    UIButton *currentBtn = _btnItemArray[currentPage];
    [currentBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    
    //变换下面的导航条
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomBar.transform = CGAffineTransformMakeTranslation(currentBtn.frame.origin.x, 0);
    }];
    
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    
    NSLog(@"will...");
    
    self.isChangeMenuOption = NO;

}

@end
