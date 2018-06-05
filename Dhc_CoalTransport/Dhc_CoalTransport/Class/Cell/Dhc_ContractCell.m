//
//  Dhc_ContractCell.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/5/29.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_ContractCell.h"

#define Width (Screen_Size_Width - 20)

#define X 10

#define LabelHeight 30

@interface Dhc_ContractCell ()

@property (nonatomic, copy) UILabel *typeLabel; // importentLabel

@property (nonatomic, copy) UILabel *flagLabel; //  flagLabel

@property (nonatomic, copy) UILabel *cont_noLabel; // 合同编号

@property (nonatomic, copy) UIView *line;

@property (nonatomic, copy) UILabel *contTextLabel; // 合同类型文字

@property (nonatomic, copy) UILabel *contLabel; // 合同类型

@property (nonatomic, copy) UILabel *sellerTextLabel; // 出卖人文字

@property (nonatomic, copy) UILabel *sellerLabel; // 出卖人

@property (nonatomic, copy) UILabel *buyerTextLabel; // 买受人文字

@property (nonatomic, copy) UILabel *buyerLabel; // 买受人

@property (nonatomic, copy) UILabel *numTextLabel; // 数量文字

@property (nonatomic, copy) UILabel *numLabel; // 数量

@property (nonatomic, copy) UILabel *timeTextLabel; // 签订时间文字

@property (nonatomic, copy) UILabel *timeLabel; // 签订时间

@end

@implementation Dhc_ContractCell

- (void)setFrame:(CGRect)frame
{
    frame.size.width -= 20;

    frame.origin.x -= -10;
    
    [super setFrame:frame];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.layer.cornerRadius = 15;
        
        self.contentView.clipsToBounds = YES;
        
        self.layer.cornerRadius = 15;
        
        self.clipsToBounds = YES;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.typeLabel];
        
        [self.contentView addSubview:self.flagLabel];

        [self.contentView addSubview:self.cont_noLabel];
        
        [self.contentView addSubview:self.line];
// **********************************************************    //
        [self.contentView addSubview:self.contTextLabel];
        
        [self.contentView addSubview:self.contLabel];
        
        [self.contentView addSubview:self.sellerTextLabel];
        
        [self.contentView addSubview:self.sellerLabel];

        [self.contentView addSubview:self.buyerTextLabel];
        
        [self.contentView addSubview:self.buyerLabel];
        
        [self.contentView addSubview:self.numTextLabel];
        
        [self.contentView addSubview:self.numLabel];

        [self.contentView addSubview:self.timeTextLabel];
        
        [self.contentView addSubview:self.timeLabel];
        
    }
    
    return self;
}

- (UILabel *)typeLabel
{
    if (_typeLabel == nil) {
        
        _typeLabel = [[UILabel alloc] init];
        
        _typeLabel.frame = CGRectMake(X, 10, 20, 20);
        
        _typeLabel.layer.cornerRadius = 10;
        
        _typeLabel.clipsToBounds = YES;
        
        _typeLabel.textColor = [UIColor whiteColor];
        
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        
        _typeLabel.font = F12;
    }
    
    return _typeLabel;
}

- (UILabel *)flagLabel
{
    if (_flagLabel == nil) {
        
        _flagLabel = [[UILabel alloc] init];
        
        _flagLabel.frame = CGRectMake(Width - 100, 5, 90, 30);
        
        _flagLabel.textAlignment = NSTextAlignmentCenter;
        
        _flagLabel.textColor = [UIColor whiteColor];
        
        _flagLabel.layer.cornerRadius = 3;
        
        _flagLabel.clipsToBounds = YES;
        
        _flagLabel.backgroundColor = Navigation_Color;
        
        _flagLabel.font = F14;
    }
    
    return _flagLabel;
}

- (UILabel *)cont_noLabel
{
    if (_cont_noLabel == nil) {
        
        _cont_noLabel = [[UILabel alloc] init];
        
        _cont_noLabel.frame = CGRectMake(CGRectGetMaxX(_typeLabel.frame) + 5, 0, Width - 30 - _typeLabel.frame.size.width - _flagLabel.frame.size.width, 40);
        
        _cont_noLabel.font = F18;
        
    }
    
    return _cont_noLabel;
}

- (UIView *)line
{
    if (_line == nil) {
        
        _line = [[UIView alloc] init];
        
        _line.frame = CGRectMake(X, CGRectGetMaxY(_cont_noLabel.frame) + 5, Width - 20, 1);
        
        _line.backgroundColor = RGBColor(230, 230, 230);
    }
    
    return _line;
}

- (UILabel *)contTextLabel
{
    if (_contTextLabel == nil) {
        
        _contTextLabel = [[UILabel alloc] init];
        
        _contTextLabel.frame = CGRectMake(X, CGRectGetMaxY(_line.frame) + 5, Width / 2, LabelHeight);
        
        _contTextLabel.font = F14;
        
        _contTextLabel.text = @"合同类型";
    }
    
    return _contTextLabel;
}

- (UILabel *)contLabel
{
    if (_contLabel == nil) {
        
        _contLabel = [[UILabel alloc] init];
        
        _contLabel.frame = CGRectMake(CGRectGetMaxX(_contTextLabel.frame), CGRectGetMaxY(_line.frame) + 5, Width / 2 - 10, LabelHeight);
        
        _contLabel.font = F14;
        
        _contLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _contLabel;
}

- (UILabel *)sellerTextLabel
{
    if (_sellerTextLabel == nil) {
        
        _sellerTextLabel = [[UILabel alloc] init];
        
        _sellerTextLabel.frame = CGRectMake(X, CGRectGetMaxY(_contTextLabel.frame), Width / 2, LabelHeight);
        
        _sellerTextLabel.font = F14;
        
        _sellerTextLabel.text = @"出卖人";
    }
    
    return _sellerTextLabel;
}

- (UILabel *)sellerLabel
{
    if (_sellerLabel == nil) {
        
        _sellerLabel = [[UILabel alloc] init];
        
        _sellerLabel.frame = CGRectMake(CGRectGetMaxX(_sellerTextLabel.frame), CGRectGetMaxY(_contTextLabel.frame), Width / 2 - 10, LabelHeight);
        
        _sellerLabel.font = F14;
        
        _sellerLabel.textAlignment = NSTextAlignmentRight;
    }
    
    return _sellerLabel;
}

- (UILabel *)buyerTextLabel
{
    if (_buyerTextLabel == nil) {
        
        _buyerTextLabel = [[UILabel alloc] init];
        
        _buyerTextLabel.frame = CGRectMake(X, CGRectGetMaxY(_sellerTextLabel.frame), Width / 2, LabelHeight);
        
        _buyerTextLabel.text = @"买受人";
        
        _buyerTextLabel.font = F14;
    }
    
    return _buyerTextLabel;
}

- (UILabel *)buyerLabel
{
    if (_buyerLabel == nil) {
        
        _buyerLabel = [[UILabel alloc] init];
        
        _buyerLabel.frame = CGRectMake(CGRectGetMaxX(_sellerTextLabel.frame), CGRectGetMaxY(_sellerLabel.frame), Width / 2 - 10, LabelHeight);
        
        _buyerLabel.textAlignment = NSTextAlignmentRight;
        
        _buyerLabel.font = F14;
    }
    
    return _buyerLabel;
}

- (UILabel *)numTextLabel
{
    if (_numTextLabel == nil) {
        
        _numTextLabel = [[UILabel alloc] init];
        
        _numTextLabel.frame = CGRectMake(X, CGRectGetMaxY(_buyerTextLabel.frame), Width / 2, LabelHeight);
        
        _numTextLabel.text = @"数量";
        
        _numTextLabel.font = F14;
    }
    
    return _numTextLabel;
}

- (UILabel *)numLabel
{
    if (_numLabel == nil) {
        
        _numLabel = [[UILabel alloc] init];
        
        _numLabel.frame = CGRectMake(CGRectGetMaxX(_numTextLabel.frame), CGRectGetMaxY(_buyerTextLabel.frame), Width / 2 - 10, LabelHeight);
        
        _numLabel.textAlignment = NSTextAlignmentRight;
        
        _numLabel.font = F14;
    }
    
    return _numLabel;
}

- (UILabel *)timeTextLabel
{
    if (_timeTextLabel == nil) {
        
        _timeTextLabel = [[UILabel alloc] init];
        
        _timeTextLabel.frame = CGRectMake(X, CGRectGetMaxY(_numTextLabel.frame), Width / 2, LabelHeight);
        
        _timeTextLabel.text = @"签订时间";
        
        _timeTextLabel.font = F14;
    }
    
    return _timeTextLabel;
}

- (UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        
        _timeLabel = [[UILabel alloc] init];
        
        _timeLabel.frame = CGRectMake(CGRectGetMaxX(_timeTextLabel.frame), CGRectGetMaxY(_numTextLabel.frame), Width / 2 - 10, LabelHeight);
        
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
        _timeLabel.font = F14;
    }
    
    return _timeLabel;
}

- (void)setModel:(Dhc_ContractModel *)model
{
    _cont_noLabel.text = model.cont_no;
    
    _flagLabel.text = model.flag;
    
    if ([model.is_important isEqualToString:@"1"]) {
        
        _typeLabel.text = @"重";
        
        _typeLabel.backgroundColor = RGBColor(253,63,63);
        
    } else {
        
        _typeLabel.text = @"普";
        
        _typeLabel.backgroundColor = Navigation_Color;
    }
    
    _contLabel.text = model.cont_type;
    
    _sellerLabel.text = model.seller_name;
    
    _buyerLabel.text = model.buyer_name;
    
    _numLabel.text = model.num;
    
    _timeLabel.text = model.signed_time;
}

@end
