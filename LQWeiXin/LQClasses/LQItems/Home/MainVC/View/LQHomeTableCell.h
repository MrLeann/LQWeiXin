//
//  LQHomeTableCell.h
//  LQWeiXin
//
//  Created by YZR on 16/6/28.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQHomeTableModel.h"


/**
 *  既然是View是布局，那么尽量减轻Controller类的布局类代码量
 *
 */

@interface LQHomeTableCell : UITableViewCell

@property(nonatomic,strong)UIImageView *icoImageView;//头像
@property(nonatomic,strong)UILabel *nameLabel;//名字
@property(nonatomic,strong)UILabel *timeLabel;//时间
@property(nonatomic,strong)UILabel *messageLabel;//消息简写

@property(nonatomic,strong)LQHomeTableModel *model;


//Cell 返回高度
+(CGFloat)fixedHeight;


@end
