//
//  CyclicAnnular.h
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 显示数据
 */
struct CyclicAnnularInfo {
    
    float contractCount;
    float realityCount;
    float theSameMonthPercent;
    float theSameTermCount;
};

/**
 名称 数量 颜色
 */
@interface CyclicAnnularMolde:NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) float count;
@property (nonatomic,copy) NSString *color;
@property (nonatomic,assign) float percent;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

+ (UIColor *)getColor:(NSString *)hexColor ;

@end


@class CyclicAnnularMolde;
@class CyclicAnnularInfo;

@interface CyclicAnnular : UIView

@property(nonatomic,assign) float openActionConstraints;

//传入数据
- (instancetype)initWithFrame:(CGRect)frame
                   dataSource:(NSArray<CyclicAnnularMolde *> *)dataSource
                   detialInfo:(struct CyclicAnnularInfo)infoSource ;

@end
