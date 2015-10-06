//
//  LCPageContentScrollView.m
//  LCSelectMenu
//
//  Created by Lee on 15-10-4.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "LCPageContentScrollView.h"

@implementation LCPageContentScrollView

+ (instancetype)pageContentScrollView{

    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor greenColor];
        
    }
    
    return self;
}

- (void)setPageViewArray:(NSArray *)pageViewArray{

    _pageViewArray = pageViewArray;
    
    NSArray *bgArray = @[[UIColor yellowColor],[UIColor redColor],[UIColor blueColor]];
    
    //配置当前视图的内容
    for (int i = 0; i<_pageViewArray.count; i++) {
        
        UIView *pageView = _pageViewArray[i];
        
        CGFloat pageViewX = i*self.frame.size.width;
        CGFloat pageViewY = 0;
        CGFloat pageViewW = self.frame.size.width;
        CGFloat pageViewH = self.frame.size.height;
        
        pageView.frame = CGRectMake(pageViewX, pageViewY, pageViewW, pageViewH);
        pageView.backgroundColor = bgArray[i];
        
        [self addSubview:_pageViewArray[i]];
        
    }
    
    self.contentSize = CGSizeMake(self.frame.size.width*_pageViewArray.count, self.frame.size.height);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
}

@end
