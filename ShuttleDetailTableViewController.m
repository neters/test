//
//  ShuttleDetailTableViewController.m
//  HoldOA
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ShuttleDetailTableViewController.h"

@interface ShuttleDetailTableViewController ()

@end

@implementation ShuttleDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.shuttleDetail) {
        self.shuttleRoute.text = self.shuttleDetail.shuttleRoute;
        self.shuttleTime.text = self.shuttleDetail.shuttleTime;
        self.shuttleSite.text = self.shuttleDetail.shuttleSite;
        self.shuttleType.text = self.shuttleDetail.shuttleType;
        self.shuttleDepartment.text = self.shuttleDetail.shuttleDepartment;
        self.shuttleTelephone.text = self.shuttleDetail.shuttleTelephone;
        self.shuttleWay.text = self.shuttleDetail.shuttleWay;
    }
    
    //[self setUpTableViewCell];
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"班车详细信息";
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30.0f;
}

@end
