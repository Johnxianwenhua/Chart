//
//  CyclicAnnularCell.h
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CyclicCollectionViewCell.h"

@protocol CyclicAnnularCellOnClick<NSObject>
@required
- (void)itemOnClickWithIndexPath:(NSIndexPath*)indexPath;

@end

@interface MenuModel:NSObject

@property (copy, nonatomic)  NSString *icon;
@property (copy, nonatomic)  NSString *title;
@property (assign,nonatomic) CGFloat cellHeight;

@property (copy, nonatomic)  NSMutableArray <CellModel*>*cellArray;

- (instancetype)initWithDiction:(NSDictionary *)dic;

@end

@interface CyclicAnnularCell : UITableViewCell
@property(nonatomic,strong) MenuModel *currentModel;
@property(nonatomic,assign) NSIndexPath *indexpath;
@property(nonatomic,weak) id<CyclicAnnularCellOnClick>delegate;

-(void)setCellWithMenuModel:(MenuModel*)model indexPath:(NSIndexPath*)indexpath;

@end
