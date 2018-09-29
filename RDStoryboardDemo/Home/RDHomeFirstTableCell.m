//
//  RDHomeFirstTableCell.m
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/9/17.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import "RDHomeFirstTableCell.h"
#import "RDHomeFirstCellModel.h"

@interface RDHomeFirstTableCell ()

@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelDetail;

@property (nonatomic, weak) IBOutlet UIButton *button;

@property (nonatomic, strong) RDHomeFirstCellModel *cellModel;

@end

@implementation RDHomeFirstTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.button.layer.cornerRadius = 5;
    
    self.labelTitle.text = @"我是标题";
    self.labelDetail.text = @"我是详情";
}

- (void)configureWithModel:(RDHomeFirstCellModel *)cellModel {
    self.cellModel = cellModel;
    self.labelTitle.text = cellModel.titleText;
    self.labelDetail.text = cellModel.detailText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(firstTableCell:didClickButtonWithModel:)]) {
        [self.delegate firstTableCell:self didClickButtonWithModel:self.cellModel];
    }
}

@end
