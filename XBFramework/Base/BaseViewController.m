//
//  BaseViewController.m
//  XBFramework
//
//  Created by zoenet on 2017/2/21.
//  Copyright © 2017年 xxb. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.leftBarButtonItem = self.leftButtonItem;
    [self xb_setup];
    [self xb_bindViewModel];
    [self xb_loadViewData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //以下这段解决push返回时，可能导致的tabbar没了的情况
    //猜测：这个方法应该是在navigationController的堆栈中push/pop完成后才调用的
    NSInteger count = self.navigationController.viewControllers.count;
    if(self.tabBarController && count == 1){
        self.tabBarController.tabBar.hidden = NO;
    }
}

-(void)xb_setup{}

-(void)xb_bindViewModel{}

-(void)xb_loadViewData{}

#pragma mark - properties

-(UIBarButtonItem*)leftButtonItem{
    if (!_leftButtonItem) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(5, 6,10,18);
        [btn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(goBack)forControlEvents:UIControlEventTouchUpInside];
        _leftButtonItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    return _leftButtonItem;
}

@end
