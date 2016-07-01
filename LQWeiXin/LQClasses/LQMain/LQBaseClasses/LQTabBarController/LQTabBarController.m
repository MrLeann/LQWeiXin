//
//  LQTabBarController.m
//  LQWeiXin
//
//  Created by YZR on 16/6/25.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQTabBarController.h"
#import "LQNavigationController.h"

//#import "LQHomeVC.h"//4个
//#import "LQContactsVC.h"//
//#import "LQDiscoverVC.h"//
//#import "LQUserVC.h"//

#import "LQHomeTableVC.h"
#import "LQContactsTableVC.h"
#import "LQDiscoverTableVC.h"
#import "LQUserTableVC.h"


@interface LQTabBarController ()<UITabBarControllerDelegate>

@end

@implementation LQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self mLoadDefaultSetting];
    
}

//初始化TabBar
-(void)mLoadDefaultSetting{

    NSArray *normalImgArr = [[NSArray alloc] initWithObjects:@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me", nil];
    NSArray *selectImgArr = [[NSArray alloc] initWithObjects:@"tabbar_mainframeHL",@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_meHL", nil];
    NSArray *titleArr = [[NSArray alloc] initWithObjects:@"首页",@"通讯录",@"发现",@"我", nil];
    NSArray *classNameArr = [[NSArray alloc] initWithObjects:@"LQHomeTableVC",@"LQContactsTableVC",@"LQDiscoverTableVC",@"LQUserTableVC", nil];
    
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] init];
    int i = 0;
    //循环初始化控制器
    for (NSString *className in classNameArr) {
        UIViewController *rtVC = [[NSClassFromString(className) alloc] init];
        
        LQNavigationController *nav = [[LQNavigationController alloc] initWithRootViewController:rtVC];
        nav.tabBarItem.title = titleArr[i];
        
        nav.tabBarItem.image = [UIImage imageNamed:normalImgArr[i]];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectImgArr[i]];
        
        //设置tabBar的整个背景颜色
        self.tabBar.barTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        //设置选中按钮的颜色
        self.tabBar.tintColor = [UIColor colorWithRed:9/255.0 green:187/255.0 blue:7/255.0 alpha:1.0];
        
        [viewControllersArray addObject:nav];
        i++;
    }
    self.viewControllers = viewControllersArray;
    
    // tabBar相关属性的设置
    self.tabBar.translucent = NO;
}

@end
