//
//  CyclicCollectionViewCell.h
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//


#import <UIKit/UIKit.h>
@interface CellModel:NSObject

@property (copy, nonatomic)  NSString *image;
@property (copy, nonatomic)  NSString *title;
@property (nonatomic) BOOL flag;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

@interface CyclicCollectionViewCell : UICollectionViewCell

@end
