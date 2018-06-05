
//
//  Dhc_ContractBaseDetailsController.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/30.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_ContractBaseDetailsController.h"

#import "YUFoldingTableView.h"

@interface Dhc_ContractBaseDetailsController () <YUFoldingTableViewDelegate>

@property (nonatomic, weak) YUFoldingTableView *foldingTableView;

@end

@implementation Dhc_ContractBaseDetailsController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.titleString = @"客户详情";
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 创建tableView
    [self setupFoldingTableView];
}

- (void)setupFoldingTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    YUFoldingTableView *foldingTableView = [[YUFoldingTableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Size_Width, self.view.bounds.size.height)];
    
    _foldingTableView = foldingTableView;
    
    [self.view addSubview:foldingTableView];
    
    foldingTableView.foldingDelegate = self;
    
    // 可以设置cell默认展开，不设置的话，默认折叠
    foldingTableView.foldingState = YUFoldingSectionStateFlod;
}

#pragma mark - YUFoldingTableViewDelegate / required（必须实现的代理）
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return 3;
}

- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 2;
}

- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 50;
}

- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [yuTableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSString *)yuFoldingTableView:(YUFoldingTableView *)yuTableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *titleArray = @[@"基本信息",@"发货信息",@"奖惩信息"];
    
    return titleArray[section];
}
// 返回箭头的位置
- (YUFoldingSectionHeaderArrowPosition)perferedArrowPositionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return YUFoldingSectionHeaderArrowPositionRight;
}

- (void )yuFoldingTableView:(YUFoldingTableView *)yuTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UIFont *)yuFoldingTableView:(YUFoldingTableView *)yuTableView fontForTitleInSection:(NSInteger )section;
{
    return [UIFont systemFontOfSize:16 weight:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

@end
