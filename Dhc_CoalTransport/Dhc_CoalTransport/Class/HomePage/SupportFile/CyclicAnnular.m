//
//  CyclicAnnular.m
//  Fortune
//
//  Created by holdtime on 2018/6/4.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "CyclicAnnular.h"

@implementation CyclicAnnularMolde

- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.title = [dic objectForKey:@"title"];
        self.count = [[dic objectForKey:@"count"] floatValue];
        self.color = [dic objectForKey:@"color"];
        self.percent = 0;
    }
    return self;
}

+ (UIColor *)getColor:(NSString *)hexColor {
    NSString *string = [hexColor substringFromIndex:1];//去掉#号
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    /* 调用下面的方法处理字符串 */
    
    red = [CyclicAnnularMolde stringToInt:[string substringWithRange:range]];
    
    range.location = 2;
    green = [CyclicAnnularMolde stringToInt:[string substringWithRange:range]];
    range.location = 4;
    blue = [CyclicAnnularMolde stringToInt:[string substringWithRange:range]];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

+ (int)stringToInt:(NSString *)string {
    
    unichar hex_char1 = [string characterAtIndex:0]; /* 两位16进制数中的第一位(高位*16) */
    int int_ch1;
    if (hex_char1 >= '0' && hex_char1 <= '9')
        int_ch1 = (hex_char1 - 48) * 16;   /* 0 的Ascll - 48 */
    else if (hex_char1 >= 'A' && hex_char1 <='F')
        int_ch1 = (hex_char1 - 55) * 16; /* A 的Ascll - 65 */
    else
        int_ch1 = (hex_char1 - 87) * 16; /* a 的Ascll - 97 */
    unichar hex_char2 = [string characterAtIndex:1]; /* 两位16进制数中的第二位(低位) */
    int int_ch2;
    if (hex_char2 >= '0' && hex_char2 <='9')
        int_ch2 = (hex_char2 - 48); /* 0 的Ascll - 48 */
    else if (hex_char1 >= 'A' && hex_char1 <= 'F')
        int_ch2 = hex_char2 - 55; /* A 的Ascll - 65 */
    else
        int_ch2 = hex_char2 - 87; /* a 的Ascll - 97 */
    return int_ch1+int_ch2;
}


@end


@interface CyclicAnnular(){
    struct CyclicAnnularInfo info;
}

@property (nonatomic,copy) NSArray <CyclicAnnularMolde *> *source;

@end

@implementation CyclicAnnular

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray<CyclicAnnularMolde *> *)dataSource detialInfo:(struct CyclicAnnularInfo)infoSource {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.source = [dataSource copy];
        info = infoSource;
        
        //需要计算
//        openActionConstraints;
    }
    return self;
}



@end
