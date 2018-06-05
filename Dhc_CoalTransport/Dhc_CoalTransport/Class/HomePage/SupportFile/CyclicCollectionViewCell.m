//
//  CyclicCollectionViewCell.m
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "CyclicCollectionViewCell.h"

@implementation CellModel

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        
        self.image = [dic objectForKey:@"img"];
        self.title = [dic objectForKey:@"title"];
        self.flag = [dic objectForKey:@"flag"];
    }
    return self;
}

@end

@interface CyclicCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIView *flag;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CyclicCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.flag.layer.cornerRadius = 5;

    // Initialization code
}
-(void)setDataWithCellModel:(CellModel *)model{
    [self.flag setHidden:model.flag];
    self.image.image = [UIImage imageNamed:model.image];
    self.label.text = model.title;

}
@end
