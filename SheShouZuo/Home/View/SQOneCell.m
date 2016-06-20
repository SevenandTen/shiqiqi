//
//  SQOneCell.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQOneCell.h"
#import "UIImageView+WebCache.h"
#define CELL_H 170
#define CELL_W [UIScreen mainScreen].bounds.size.width

@interface SQOneCell()
@property(nonatomic,strong)UIImageView *picView;
@property(nonatomic,strong)UILabel *label1;
@property(nonatomic,strong)UILabel *label2;
@property(nonatomic,strong)UILabel *label3;
@property(nonatomic,strong)UIImageView *countView;
@end

@implementation SQOneCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createSubviews];
    }
    return self;
}
-(void)createSubviews{
  
    _label1=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, CELL_W, 50)];
    _label1.numberOfLines=0;
    _label1.font=[UIFont systemFontOfSize:17];
    
    _picView =[[UIImageView alloc ] initWithFrame:CGRectMake(10, CGRectGetMaxY(_label1.frame), CELL_W-20 ,CELL_H-20-10-CGRectGetHeight(_label1.frame)-10)];
    _picView.backgroundColor=[UIColor lightGrayColor];
    // _label1.backgroundColor=[UIColor blackColor];
    _label2=[[UILabel alloc ] initWithFrame:CGRectMake(0, CGRectGetMaxY(_picView.frame)+10, 100, 20)];
    _label2.font=[UIFont systemFontOfSize:13];
    _label2.textColor=[UIColor lightGrayColor];
    //_label2.backgroundColor=[UIColor yellowColor];
    _label3=[[UILabel alloc] initWithFrame:CGRectMake(CELL_W-50, CGRectGetMaxY(_picView.frame)+10, 50, 20)];
    _label3.font=[UIFont systemFontOfSize:13];
    _label3.textColor=[UIColor lightGrayColor];
    // _label3.backgroundColor=[UIColor greenColor];
    _countView=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(_label3.frame)-20, CGRectGetMaxY(_picView.frame)+10 ,20 , 20)];
    _countView.backgroundColor=[UIColor purpleColor];
    [self.contentView addSubview:_label1];
    [self.contentView addSubview:_label2];
    [self.contentView addSubview:_label3];
    [self.contentView addSubview:_picView];
    [self.contentView addSubview:_countView];
    
}
-(void)refreshCellWithModle:(SQTwoModel *)model{
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    self.label1.text=model.title;
    self.label2.text=model.source_name;
    self.label3.text=[NSString stringWithFormat:@"%d",[model.view intValue] ];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
