//
//  RDHomeFirstCellModel.m
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/9/25.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import "RDHomeFirstCellModel.h"

@implementation RDHomeFirstCellModel

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail {
    if (self = [super init]) {
        _titleText = title;
        _detailText = detail;
    }
    return self;
}

@end
