//
//  BorderView.m
//  Fortune
//
//  Created by holdtime on 2018/6/5.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "BorderView.h"

@implementation BorderView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = UIColor.clearColor;
    self.layer.borderColor = [UIColor colorWithRed:180/255.0 green:252/255.0 blue:248/255.0 alpha:1].CGColor;
    self.layer.borderWidth = 6;
    self.layer.cornerRadius = 6;
}
@end
