//
//  LQNavigationController.m
//  LQWeiXin
//
//  Created by YZR on 16/6/25.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQNavigationController.h"

@interface LQNavigationController ()

@end

@implementation LQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

+ (void)initialize {
    /*! --- CONFIGURE THE VARIETY BAR'S PROPERTIES ---
     UINavigationBar *navBar = [UINavigationBar appearance];
     [navBar setBarTintColor:QLMainNavColor];
     [navBar setTintColor:[UIColor whiteColor]];
     [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
     
     UIBarButtonItem *barButtonItem = [UIBarButtonItem appearanceWhenContainedIn:[QLNavigationController class], nil];
     [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
     
     [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]} forState:UIControlStateDisabled];
     */
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    [super pushViewController:viewController animated:animated];
}

- (void)backAction {
    [self popViewControllerAnimated:YES];
}



@end
