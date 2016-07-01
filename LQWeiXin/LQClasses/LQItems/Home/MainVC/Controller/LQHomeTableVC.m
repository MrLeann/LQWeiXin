//
//  LQHomeTableVC.m
//  LQWeiXin
//
//  Created by YZR on 16/6/25.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQHomeTableVC.h"
#import "LQHomeTableCell.h"
#import "LQHomeTableModel.h"//模型


#import "UIView+SDAutoLayout.h"//约束设置
#import "LQAnalogDataGenerator.h"//随机数据类


#define kHomeTableCellID @"LQHomeTableCell"//cell ID

//添加手势协议
@interface LQHomeTableVC ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UISearchController *searchController;//搜索

@end


@implementation LQHomeTableVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置模型
    [self mSetDataWithCount:20];
    
    //表格相关
    [self mSetTableView];
    
   
    
    
    
}

//
-(UISearchController *)searchController{

    if (!_searchController) {
        _searchController = [[UISearchController alloc] initWithSearchResultsController:[UIViewController new]];
        
        
    }
    return _searchController;
}

//表格相关
-(void)mSetTableView{
    //返回行高,行高返回 分离在View层？为毛
    self.tableView.rowHeight = [LQHomeTableCell fixedHeight];
    
    [self.tableView registerClass:[LQHomeTableCell class] forCellReuseIdentifier:kHomeTableCellID];
    
    //设置背景透明
    self.tableView.backgroundColor = [UIColor clearColor];
}

//设置模型
-(void)mSetDataWithCount:(NSInteger)count{
    
    //
    for(int i = 0;i < count; i++){
        
        LQHomeTableModel *model = [LQHomeTableModel new];
        model.vImageName = [LQAnalogDataGenerator randomIconImageName];
        model.vName = [LQAnalogDataGenerator randomName];
        model.vMessage = [LQAnalogDataGenerator randomMessage];
        
        NSLog(@"输出%@",model.vName);
        [self.dataArray addObject:model];
    }
}

#pragma mark - 表格协议相关
//返回组数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LQHomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeTableCellID];
    if(cell == nil){
        cell = [[LQHomeTableCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kHomeTableCellID];
        
        
    }
    
    cell.model = self.dataArray[indexPath.row];
    return cell;
}




@end
