//
//  ViewController.m
//  LCSelectMenu
//
//  Created by Lee on 15-10-3.
//  Copyright (c) 2015年 Lee. All rights reserved.
//

#import "ViewController.h"
#import "LCSelectMenu.h"
#import "LCContentView.h"

@interface ViewController ()<LCSelectMenuProtocol,UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollViewContent;

@property (nonatomic,assign) int currentPage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

- (void)createView{
    
//    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//
//    LCSelectMenu *menu = [[LCSelectMenu alloc]initWithFrame:CGRectMake(0, 0, width, 44)];
//    [self.view addSubview:menu];
//    NSArray *titleArray = @[@"体育",@"新闻",@"CCTV"];
//    menu.menuItemArray = titleArray;
//    menu.lcDelegate = self;
//    
//    //创建滚动视图
//    UIScrollView *scrollViewContent = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height-44)];
//    [self.view addSubview:scrollViewContent];
//    self.scrollViewContent = scrollViewContent;
//    self.scrollViewContent.delegate = self;
//    
//    NSArray *array = @[[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor]];
//    
//    for (int i=0; i<3; i++) {
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i*self.view.frame.size.width, 0, scrollViewContent.frame.size.width, scrollViewContent.frame.size.height)];
//        [scrollViewContent addSubview:view];
//        UIColor *color = array[i];
//        [view setBackgroundColor:color];
//    }
//    
//    scrollViewContent.contentSize = CGSizeMake(self.view.frame.size.width *3, scrollViewContent.frame.size.height);

    LCContentView *contentView = [LCContentView contentView];
    [self.view addSubview:contentView];

    
    
    
}


- (void)LCSelectMenuPageTouchUp:(UIView *)view andPage:(NSNumber *)page{

    NSLog(@"page:%d",[page intValue]);
    
    [self.scrollViewContent setContentOffset:CGPointMake([page intValue]*self.view.frame.size.width, 0) animated:YES];
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int _page = scrollView.frame.origin.x/scrollView.frame.size.width;
    
    self.currentPage = _page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
