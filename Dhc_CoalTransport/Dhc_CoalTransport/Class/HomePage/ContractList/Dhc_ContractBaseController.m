//
//  Dhc_ContractBaseController.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_ContractBaseController.h"

#import "Dhc_ContractTopView.h"

#import "Dhc_ContractCell.h"

#import "Dhc_ContractModel.h"

#import "Dhc_ContractBaseDetailsController.h"

#import "YBPopupMenu.h"
 
@interface Dhc_ContractBaseController () <UITableViewDelegate, UITableViewDataSource,YBPopupMenuDelegate>

@property (nonatomic, copy) Dhc_ContractTopView *topView;

@property (nonatomic, copy) UITableView *tableView;

@property (nonatomic, copy) NSMutableArray *data;

@property (nonatomic, copy) NSMutableArray *dataSource;

@property (nonatomic, assign) NSInteger page;

@end

@implementation Dhc_ContractBaseController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = RGBColor(242, 241, 242);
    
    _page = 5;
    
    _dataSource = [[NSMutableArray alloc] init];
    
    [self initDataWithPage];

    [self addTopView];
    
    [self addTableView];
    
}

- (void)initDataWithPage
{
    _data = [[NSMutableArray alloc] init];
    
    NSDictionary *parame = [[NSDictionary alloc] initWithObjectsAndKeys:@"sbfgs",@"username",_bus_type,@"bus_type",@"-1",@"page",@"-1",@"num", nil];
    
    WeakSelf(self);
    
    [Dhc_HttpTool PostWithUrl:ContractUrl Params:parame Success:^(id json) {
        
        if ([Dhc_AnalyticalData contractData:json].count != 0) {

            weakself.data = [Dhc_AnalyticalData contractData:json];
            
        }

         [self createDataSource];
        
    } Failure:^(NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"请求错误......"];
        
        [SVProgressHUD dismissWithDelay:1];
        
    }];
}

- (void)createDataSource
{
    //dataSource (数组)  每次需要展现的数据，代理方法中，都用这个数组进行赋值。
    
    if (_data.count == self.dataSource.count) { //判断是否加载了所有数据
        
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        
    } else {
        
        //循环_data   将需要展现到cell上的数据添加到_dataSource中
        
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < _data.count; i++) {
            
            if (i < _page) {
                
                [mutableArray addObject:_data[i]];
                
            } else {
                
                break;
                
            }
            
            self.dataSource = mutableArray;
            
        }
        
        _page += 4;
        
        [_tableView reloadData];
        
        [_tableView.mj_footer  endRefreshing];
        
    }
}

- (void)addTopView
{
    self.navigationController.navigationBarHidden = YES;
    
    Dhc_ContractTopView *topView = [[Dhc_ContractTopView alloc] initWithFrame:CGRectMake(0, 0, Screen_Size_Width, 128)];
    
    topView.titleString = _titleString;
    
    [topView.filterBut addTarget:self action:@selector(filterButClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:topView];
    
    _topView = topView;
}

- (void)filterButClicked:(UIButton *)sender
{
    NSArray *titleArray = @[@"1",@"2",@"3",@"4",@"5"];
    
    [YBPopupMenu showRelyOnView:sender titles:titleArray icons:nil menuWidth:Screen_Size_Width - 20 otherSettings:^(YBPopupMenu *popupMenu) {
        
        popupMenu.priorityDirection = YBPopupMenuPriorityDirectionBottom;
        
        popupMenu.borderWidth = 1;
        
        popupMenu.delegate = self;
        
        popupMenu.borderColor = [UIColor redColor];
    }];
}

- (void)addTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame) - 30, Screen_Size_Width, Screen_Size_Height - _topView.frame.size.height + 30) style:UITableViewStyleGrouped];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(createDataSource)];

    [tableView registerClass:[Dhc_ContractCell class] forCellReuseIdentifier:Dhc_ContractCellID];
    
    [self.view addSubview:tableView];
    
    _tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Dhc_ContractCell *cell = [tableView dequeueReusableCellWithIdentifier:Dhc_ContractCellID forIndexPath:indexPath];
    
    cell.model = _dataSource[indexPath.section];
    
    return cell;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.topView.filterBut removeFromSuperview];
    
    [self.topView.textField removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.topView.filterBut];

    [[[UIApplication sharedApplication] keyWindow] addSubview:self.topView.textField];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Dhc_ContractBaseDetailsController *detailsVC = [[Dhc_ContractBaseDetailsController alloc] init];
    
    [self.navigationController pushViewController:detailsVC animated:YES];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
