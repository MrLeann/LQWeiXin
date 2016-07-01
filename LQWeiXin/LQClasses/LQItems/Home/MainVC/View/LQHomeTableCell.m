
//
//  LQHomeTableCell.m
//  LQWeiXin
//
//  Created by YZR on 16/6/28.
//  Copyright © 2016年 YZR. All rights reserved.
//

#import "LQHomeTableCell.h"
#import "UIView+SDAutoLayout.h"

#define kDeleteButtonWidth      60.0f    //删除按钮宽度
#define kTagButtonWidth         100.0f   //标记未读按钮宽度
#define kCriticalTranslationX   30       //
#define kShouldSlideX           -2       //


@interface LQHomeTableCell (){
    UIButton *_deleteButton;
    UIButton *_tagButton;
    
    UIPanGestureRecognizer *_pan;
    UITapGestureRecognizer *_tap;
    
    BOOL _shouldSlide;
}

@property(nonatomic,assign)BOOL isSlided;

@end

@implementation LQHomeTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self mSetView];//UI
        
    }
    return self;
}

//set UI action
-(void)mSetView{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;//点击无色
    
    _icoImageView = [UIImageView new];
    _icoImageView.layer.cornerRadius = 5;
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.textColor = [UIColor blackColor];
    
    _timeLabel = [UILabel new];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor lightGrayColor];
    
    _messageLabel = [UILabel new];
    _messageLabel.font = [UIFont systemFontOfSize:14];
    _messageLabel.textColor = [UIColor lightGrayColor];
    
    //UIButton 也是可以初始化的哦
    _deleteButton = [UIButton new];
    _deleteButton.backgroundColor = [UIColor redColor];
    [_deleteButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    
    //标记按钮
    _tagButton = [UIButton new];
    _tagButton.backgroundColor = [UIColor lightGrayColor];
    [_tagButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_tagButton setTitle:@"标记未读" forState:UIControlStateNormal];
    
    [self.contentView addSubview:_icoImageView];
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_messageLabel];
    
     //A insertSubView B belowSubview:C  是将B插入A并且在A已有的子视图C的下面
    [self insertSubview:_deleteButton belowSubview:self.contentView];
    [self insertSubview:_tagButton belowSubview:self.contentView];
   
    //删除按钮添加约束
    _deleteButton.sd_layout.topEqualToView(self).rightEqualToView(self).bottomEqualToView(self).widthIs(kDeleteButtonWidth);//上、有、底部间距与参照控件间距相同
    
    //标记按钮
    _tagButton.sd_layout.topEqualToView(_deleteButton).bottomEqualToView(_deleteButton).rightSpaceToView(_deleteButton,0).widthIs(kTagButtonWidth);
    
    //头像位置
    CGFloat margin = 10;
    _icoImageView.sd_layout.widthIs(50).heightEqualToWidth().leftSpaceToView(self.contentView,margin).topSpaceToView(self.contentView,margin);
    //名字
    _nameLabel.sd_layout.topEqualToView(_icoImageView).leftSpaceToView(_icoImageView,margin).rightSpaceToView(self.contentView,80).heightIs(26);
    
    //时间（位于右上角的）
    _timeLabel.sd_layout.rightSpaceToView(self.contentView,margin).centerYEqualToView(_nameLabel).heightIs(16);
    
    [_timeLabel setSingleLineAutoResizeWithMaxWidth:60];////设置单行文本宽度自适应
    
    _messageLabel.sd_layout.leftEqualToView(_nameLabel).bottomSpaceToView(self.contentView,margin * 1.3).heightIs(18).rightSpaceToView(self.contentView,margin);
    
    
}

//
-(void)setModel:(LQHomeTableModel *)model{
    _model = model;
    
    self.icoImageView.image = [UIImage imageNamed:model.vImageName];
    self.nameLabel.text = model.vName;
    self.timeLabel.text = model.vTime;
    self.messageLabel.text = model.vMessage;
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


//返回行高，把所有UI 设计放到View层次
+(CGFloat)fixedHeight{
    return 70;
}





@end
