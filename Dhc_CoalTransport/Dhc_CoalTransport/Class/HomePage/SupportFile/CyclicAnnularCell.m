//
//  CyclicAnnularCell.m
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "CyclicAnnularCell.h"



@implementation MenuModel

- (instancetype)initWithDiction:(NSDictionary *)dic
{
    self = [super init];
    if (self) {

        self.icon = [dic objectForKey:@"img"];
        self.title= [dic objectForKey:@"title"];
        NSArray *item = [dic objectForKey:@"item"];
        [self.cellArray removeAllObjects];
        for(int i=0;i<item.count;i++){
             CellModel *model = [[CellModel alloc]initWithDictionary:item[i]];
            [self.cellArray addObject:model];
        }
        
        NSInteger xCount = self.cellArray.count%4;
        NSInteger yCount = self.cellArray.count/4;
        
        CGFloat offsetCount = xCount > 0?yCount + 1:yCount;
        self.cellHeight = offsetCount*95 - (offsetCount*5) + 65;
        
        
    }
    return self;
}

-(NSMutableArray<CellModel *> *)cellArray{
    if(!_cellArray){
        _cellArray = [NSMutableArray array];
    }
    return _cellArray;
}

@end

@interface CyclicAnnularCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;


@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (strong, nonatomic) UICollectionView *collectionView;


@end

@implementation CyclicAnnularCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle =  UITableViewCellSelectionStyleNone;
   
    self.baseView.layer.cornerRadius = 5;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CyclicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CyclicCollectionViewCell"];
    
    // Initialization code
}

-(void)setCellWithMenuModel:(MenuModel*)model indexPath:(NSIndexPath*)indexpath{
    self.currentModel = model;
    self.icon.image = [UIImage imageNamed:model.icon];
    self.title.text = model.title;
    self.indexpath = indexpath;

    self.collectionView.frame = CGRectMake(self.icon.frame.origin.x,
                                           CGRectGetMaxY(self.icon.frame)+5,
                                           [UIScreen mainScreen].bounds.size.width-40,
                                           model.cellHeight - 75);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CyclicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CyclicCollectionViewCell" forIndexPath:indexPath];

    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.currentModel.cellArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){([UIScreen mainScreen].bounds.size.width - 80)/4,80};
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate itemOnClickWithIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:self.indexpath.row]];
}

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.backgroundColor = UIColor.whiteColor;
        _collectionView.dataSource = self;
        [_collectionView setScrollEnabled:NO];
        [self.baseView addSubview:_collectionView];
    }
    return _collectionView;
}

@end
