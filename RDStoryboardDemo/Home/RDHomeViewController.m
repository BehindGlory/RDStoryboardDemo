//
//  RDHomeViewController.m
//  RDStoryboardDemo
//
//  Created by Rain Day on 2018/8/31.
//  Copyright © 2018年 Rain Day. All rights reserved.
//

#import "RDHomeViewController.h"
#import "RDHomeFirstTableCell.h"
#import "RDHomeFirstCellModel.h"

@interface RDHomeViewController () <UITableViewDataSource, UITableViewDelegate, RDHomeFirstTableCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint *tableViewLeftConstraint;

@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation RDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";

    self.tableViewLeftConstraint.constant = 0;

    RDHomeFirstCellModel *cellModel1 = [[RDHomeFirstCellModel alloc] initWithTitle:@"标题1" detail:@"详情2"];
    RDHomeFirstCellModel *cellModel2 = [[RDHomeFirstCellModel alloc] initWithTitle:@"标题2" detail:@"详情2"];
    self.dataSource = @[cellModel1, cellModel2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RDHomeFirstTableCell";
    RDHomeFirstTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.delegate = self;
    [cell configureWithModel:self.dataSource[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - RDHomeFirstTableCellDelegate
- (void)firstTableCell:(RDHomeFirstTableCell *)firstTableCell didClickButtonWithModel:(RDHomeFirstCellModel *)cellModel {
    NSLog(@"%@  %@", cellModel.titleText, cellModel.detailText);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
