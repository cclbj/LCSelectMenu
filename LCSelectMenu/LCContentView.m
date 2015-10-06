//
//  LCContentView.m
//  LCSelectMenu
//
//  Created by Lee on 15-10-4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "LCContentView.h"
#import "LCPageContentScrollView.h"
#import "LCSelectMenu.h"

@interface LCContentView ()<LCSelectMenuProtocol,UIScrollViewDelegate>

@property (nonatomic,weak) LCSelectMenu *selectMenu;

@property (nonatomic,weak) LCPageContentScrollView *pageContentView;

@property (nonatomic,assign) int currentPage;

@end

@implementation LCContentView

+ (instancetype)contentView{

    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
    }
    
    return self;
}

- (void)setMenuTitleArray:(NSArray *)menuTitleArray{

    self.selectMenu.menuTitleArray = menuTitleArray;
    
}

- (void)setPageViewArray:(NSArray *)pageViewArray{

    self.pageContentView.pageViewArray = pageViewArray;
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview{

    self.frame = newSuperview.frame;
    
    //创建选项视图
    LCSelectMenu *selectMenu = [LCSelectMenu selectMenu];
    [self addSubview:selectMenu];
    self.selectMenu = selectMenu;
    self.selectMenu.frame = CGRectMake(0, 0, self.frame.size.width, 44);
    self.selectMenu.lcDelegate = self;
    
    //创建底部页面滚动视图
    LCPageContentScrollView *pageContentView = [LCPageContentScrollView pageContentScrollView];
    [self addSubview:pageContentView];
    self.pageContentView = pageContentView;
    self.pageContentView.delegate = self;
    
    CGFloat pageContentViewX = 0;
    CGFloat pageContentViewY = CGRectGetMaxY(selectMenu.frame);
    CGFloat pageContentViewW = self.frame.size.width;
    CGFloat pageContentViewH = self.frame.size.height - 44;
    
    pageContentView.frame = CGRectMake(pageContentViewX, pageContentViewY, pageContentViewW, pageContentViewH);
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSArray *titleArray = @[@"北京",@"上海",@"广州"];
    
    for (int i=0; i<3; i++) {
        UIView *view = [[UIView alloc]init];
        [array addObject:view];
    }
    self.pageContentView.pageViewArray = array;
    self.selectMenu.menuTitleArray = titleArray;
}

- (void)LCSelectMenuPageTouchUp:(UIView *)view andPage:(NSNumber *)page{

    CGFloat offetX = [page intValue] * self.frame.size.width;
    self.pageContentView.contentOffset = CGPointMake(offetX, 0);
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int page = scrollView.contentOffset.x/self.frame.size.width;
    [self.selectMenu setCurrentItemSelected:page];
    
}

@end
