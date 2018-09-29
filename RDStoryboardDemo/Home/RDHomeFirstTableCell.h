//
//  RDHomeFirstTableCell.h
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/9/17.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDHomeFirstCellModel;
@protocol RDHomeFirstTableCellDelegate;
@interface RDHomeFirstTableCell : UITableViewCell

@property (nonatomic, weak) id <RDHomeFirstTableCellDelegate> delegate;

- (void)configureWithModel:(RDHomeFirstCellModel *)cellModel;

@end

@protocol RDHomeFirstTableCellDelegate <NSObject>

- (void)firstTableCell:(RDHomeFirstTableCell *)firstTableCell didClickButtonWithModel:(RDHomeFirstCellModel *)cellModel;

@end
