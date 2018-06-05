//
//  Dhc_HomePageController.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_HomePageController.h"
#import "CyclicAnnular.h"
#import "CyclicAnnularCell.h"
#import "LeftCollectionViewCell.h"
#import "RightCollectionViewCell.h"
#import "Chart.h"
#import "Dhc_ContractBaseController.h"
@interface Dhc_HomePageController () <CyclicAnnularCellOnClick>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property(nonatomic,copy) NSMutableArray <MenuModel*>*plistSource;
@property(nonatomic,copy) NSMutableArray <CyclicAnnularMolde*>*statisticsSource;

@property (weak, nonatomic) IBOutlet UILabel *contractCount;
@property (weak, nonatomic) IBOutlet UILabel *contractCountDetial;
@property (weak, nonatomic) IBOutlet UILabel *realityCount;
@property (weak, nonatomic) IBOutlet UILabel *realityCountDetial;
@property (weak, nonatomic) IBOutlet UILabel *theSameMonthPercent;
@property (weak, nonatomic) IBOutlet UILabel *theSameMonthPercentDetial;
@property (weak, nonatomic) IBOutlet UILabel *theSameTermCount;
@property (weak, nonatomic) IBOutlet UILabel *theSameTermCountDetial;
@property (weak, nonatomic) IBOutlet Chart *tPieChart;

@end

@implementation Dhc_HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSURL *defaultPrefsFile = [[NSBundle mainBundle] URLForResource:@"MenuInfo" withExtension:@"plist"];
    
    NSDictionary *defaultPrefs = [NSDictionary dictionaryWithContentsOfURL:defaultPrefsFile];
    NSArray *dataArray = [defaultPrefs objectForKey:@"MenuInfo"];
    
    for(int i =0;i<dataArray.count;i++){
        MenuModel *model = [[MenuModel alloc]initWithDiction:dataArray[i]];
        [self.plistSource addObject:model];
    }
    
    NSArray *staArray = [defaultPrefs objectForKey:@"MenuHeader"];
    
    float total = 0;
    
    for(int i =0;i<staArray.count;i++){
        CyclicAnnularMolde *model = [[CyclicAnnularMolde alloc]initWithDictionary:staArray[i]];
        total += model.count;
    }
    
    for(int i =0;i<staArray.count;i++){
        CyclicAnnularMolde *model = [[CyclicAnnularMolde alloc]initWithDictionary:staArray[i]];
        model.percent = model.count/total;
        [self.statisticsSource addObject:model];
    }
    
    self.contractCount.text = @"456543";
    self.realityCount.text = @"3465";
    self.theSameMonthPercent.text = @"56%";
    self.theSameTermCount.text = @"88%";
    
    [self.tPieChart setChartWithArray:self.statisticsSource];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CyclicAnnularCell" bundle:nil] forCellReuseIdentifier:@"CELLIDENTIFIER"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"LeftCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LeftCollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"RightCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [self.collectionView setScrollEnabled:NO];
    
    
}
- (IBAction)tAnnularViewAction:(UIButton *)sender {
    
    self.tCountSortView.alpha = sender.isSelected?0:1;
    
    [UIView animateWithDuration:0.35 animations:^{
        self.tAnnularConstraints.constant = !sender.isSelected?[self calculateTheStatisticsSourceHeight]:250;
        self.tColloctionViewConstraints.constant = !sender.isSelected?[self calculateTheCollectionViewHeight]:250;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if(self.statisticsSource.count>8&&!sender.isSelected){
            [self.collectionView setScrollEnabled:YES];
        }else{
            [self.collectionView setScrollEnabled:NO];
        }
        [self.tCountSortView setHidden:sender.isSelected];
        [sender setSelected:!sender.isSelected];
        [sender setImage:sender.isSelected?[UIImage imageNamed:@"close"]:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
    }];
}



-(NSMutableArray *)plistSource{
    if(_plistSource == nil){
        _plistSource = [NSMutableArray array];
    }
    return _plistSource;
}
- (NSMutableArray<CyclicAnnularMolde *> *)statisticsSource{
    if(_statisticsSource == nil){
        _statisticsSource = [NSMutableArray array];
    }
    return _statisticsSource;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{return 1;}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.plistSource.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuModel *model = self.plistSource[indexPath.row];
    return model.cellHeight;
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{return 44;}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CyclicAnnularCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLIDENTIFIER"];
    [cell setCellWithMenuModel:self.plistSource[indexPath.row] indexPath:indexPath];
    cell.delegate = self;
    return cell;
}

- (void)itemOnClickWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld-%ld",indexPath.section,indexPath.row);
    [self.navigationController pushViewController:[[Dhc_ContractBaseController alloc]init] animated:YES];
}


#pragma CollectionView

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CyclicAnnularMolde *model = self.statisticsSource[indexPath.row];
    
    if(indexPath.row%2==0){
        LeftCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LeftCollectionViewCell" forIndexPath:indexPath];
        [cell setDataWithCyclicModel:model];
        return cell;
    }else{
        RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
        [cell setDataWithCyclicModel:model];
        return cell;
    }
    
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.statisticsSource.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){([UIScreen mainScreen].bounds.size.width -20)/2,100};
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

- (CGFloat)calculateTheStatisticsSourceHeight{
    
    if (self.statisticsSource.count >= 8 ){
        
        return [UIScreen mainScreen].bounds.size.height-(40 + 100);
    }else{
        NSInteger xCount = self.statisticsSource.count%2;
        NSInteger yCount = self.statisticsSource.count/2;
        
        CGFloat offsetCount = xCount > 0?yCount + 1:yCount;
        return offsetCount*100+260;
    }
}
- (CGFloat)calculateTheCollectionViewHeight{
    return [self calculateTheStatisticsSourceHeight]-160-80;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

@end
