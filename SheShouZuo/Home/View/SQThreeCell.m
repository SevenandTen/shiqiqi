//
//  SQThreeCell.m
//  SheShouZuo
//
//  Created by qianfeng on 16/6/19.
//  Copyright © 2016年 1077. All rights reserved.
//

#import "SQThreeCell.h"
#import "UIImageView+WebCache.h"


#define CELL_H 200
#define CELL_W [UIScreen mainScreen].bounds.size.width
@interface SQThreeCell()
@property(nonatomic,strong)UIImageView *picView;

@end

@implementation SQThreeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _picView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, CELL_W-20, CELL_H-20)];
        _picView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_picView];
       
    }
    return self;
}
-(void)refreshCellWithModle:(SQThreeModel *)model{
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
