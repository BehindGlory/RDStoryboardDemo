//
//  RDHomeFirstCellModel.h
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/9/25.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDHomeFirstCellModel : NSObject

@property (nonatomic, copy) NSString *titleText;
@property (nonatomic, copy) NSString *detailText;

- (instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail;

@end
