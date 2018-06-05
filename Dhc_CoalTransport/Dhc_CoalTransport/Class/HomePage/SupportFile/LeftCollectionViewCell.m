//
//  LeftCollectionViewCell.m
//  Fortune
//
//  Created by holdtime on 2018/6/5.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "LeftCollectionViewCell.h"
#import "CyclicAnnular.h"
@interface LeftCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *track;
@property (weak, nonatomic) IBOutlet UILabel *percent;
@property (weak, nonatomic) IBOutlet UILabel *line;
@property (weak, nonatomic) IBOutlet UILabel *progress;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressValue;

@end

@implementation LeftCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.progress.clipsToBounds = YES;
    self.track.clipsToBounds = YES;
    self.track.layer.cornerRadius = self.track.frame.size.height/2;
    self.progress.layer.cornerRadius = self.progress.frame.size.height/2;
    // Initialization code
}

- (void)setDataWithCyclicModel:(CyclicAnnularMolde*)model{
    self.title.text = model.title;
    self.progress.backgroundColor = [CyclicAnnularMolde getColor:model.color];
    self.percent.text = [[NSString stringWithFormat:@"%.2f",model.percent*100] stringByAppendingString:@"%"];
    self.progressValue.constant = (70*model.percent)>2?70*model.percent:2;

}

@end
