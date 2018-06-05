//
//  Dhc_LoginTopView.m
//  Dhc_CoalTransport
//
//  Created by ArrogantDevils on 2018/6/4.
//  Copyright © 2018年 Dhc. All rights reserved.
//

#import "Dhc_LoginTopView.h"

@implementation Dhc_LoginTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
                
        UIImageView *backImage = [[UIImageView alloc] init];
        
        backImage.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        backImage.image = [UIImage imageNamed:@"login_back"];
        
        backImage.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:backImage];
        
        CGFloat logoWidth = 100, logoHeight = 100;
        
        UIImageView *logoImage = [[UIImageView alloc] init];
        
        logoImage.frame = CGRectMake((Screen_Size_Width - logoWidth) / 2, (frame.size.height - logoHeight) / 2, logoWidth, logoHeight);
        
        logoImage.image = [UIImage imageNamed:@"login_logo"];
        
        logoImage.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:logoImage];
        
        UILabel *textLabel = [[UILabel alloc] init];
        
        textLabel.frame = CGRectMake((Screen_Size_Width - logoWidth) / 2, CGRectGetMaxY(logoImage.frame) + 5, logoWidth, logoHeight / 2);
        
        textLabel.text = @"陕煤运销";
        
        textLabel.textAlignment = NSTextAlignmentCenter;
        
        textLabel.font = F20;
        
        textLabel.textColor = [UIColor whiteColor];
        
        [self addSubview:textLabel];
        
    }
    
    return self;
}

@end
