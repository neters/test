//
//  ShuttleViewController.m
//  HoldOA
//
//  Created by admin on 16/9/29.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ShuttleViewController.h"
#import "ShuttleTableViewCell.h"
#import "ShuttleDetailTableViewController.h"
#import "ShuttleManager.h"

@interface ShuttleViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray *cellArray;
@property (strong, nonatomic)NSArray *cellData;

@end

@implementation ShuttleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self getShuttleData];
    [self setUpTableViewCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - functional methods

- (void)getShuttleData {
    self.cellData = @[@[@"7:20(周一～周五)",@"冀A12345", @"113912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"],
                      @[@"7:20(周一～周五)",@"冀A12345", @"213912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"],
                      @[@"7:20(周一～周五)",@"冀A12345", @"313912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"],
                      @[@"7:20(周一～周五)",@"冀A12345", @"413912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"],
                      @[@"7:20(周一～周五)",@"冀A12345", @"513912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"],
                      @[@"7:20(周一～周五)",@"冀A12345", @"613912345678",@"所区  ⇋  西区",@"行政楼门前",@"厦门金龙(冀A23456)26人",@"第十六专业部",@"预约／检票"]];
}

- (void)setUpTableViewCell {
    self.cellArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.cellData.count; ++i) {
        NSArray *array = [self.cellData objectAtIndex:i];
        
        NSString *depart = [NSString stringWithFormat:@"%@", [array objectAtIndex:0]];
        NSString *plateNumber = [NSString stringWithFormat:@"%@",[array objectAtIndex:1]];
        NSString *telephone = [NSString stringWithFormat:@"%@", [array objectAtIndex:2]];
        
        NSDictionary *dict = @{@"depart":depart, @"plateNumber":plateNumber, @"telephone":telephone};
        
        [self.cellArray addObject:dict];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 不显示footer
    self.tableView.tableFooterView = [UIView new];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ShuttleDetailTableViewController *vc = (ShuttleDetailTableViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSLog(@"selected row:%ld", indexPath.row);
    
    NSArray *detail = [self.cellData objectAtIndex:indexPath.row];
    vc.shuttleDetail = [[ShuttleManager alloc] initWithName:[detail objectAtIndex:0] shuttleNumber:[detail objectAtIndex:1] shuttleTelephone:[detail objectAtIndex:2] shuttleRoute:[detail objectAtIndex:3] shuttleSite:[detail objectAtIndex:4] shuttleType:[detail objectAtIndex:5] shuttleDepartment:[detail objectAtIndex:6] shuttleWay:[detail objectAtIndex:7]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShuttleTableViewCell *cell = (ShuttleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ShuttleCell" forIndexPath:indexPath];
    NSDictionary *dict = self.cellArray[indexPath.row];
    
    cell.departLabel.text = dict[@"depart"];
    cell.plateNumberLabel.text = dict[@"plateNumber"];
    cell.telephoneLabel.text = dict[@"telephone"];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

@end
