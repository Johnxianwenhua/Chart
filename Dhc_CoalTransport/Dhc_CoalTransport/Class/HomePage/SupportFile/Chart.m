//
//  Chart.m
//  Fortune
//
//  Created by holdtime on 2018/6/5.
//  Copyright © 2018年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "Chart.h"

@implementation Chart


-(void)setChartWithArray:(NSArray <CyclicAnnularMolde*> *)annularArray{
    
    CGFloat tempAngle = 0;
    for(int i =0;i<annularArray.count;i++){
        CyclicAnnularMolde *model = annularArray[i];
        
        float total = M_PI*2;
        
        CGFloat pre = model.percent * total;
        
        if (pre < 0.05){pre = 0.05;}
        
        CGFloat endAngle = pre + tempAngle;
    
        [self drawProgress:tempAngle endAngle:endAngle strokeColor:model.color];
        tempAngle = endAngle;
    }
}

-(void)drawProgress:(CGFloat)startAngle endAngle:(CGFloat)endAngle strokeColor:(NSString *)color{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, self.frame.size.width-40, self.frame.size.height-40);
    

    if([UIScreen mainScreen].bounds.size.height == 736){
        shapeLayer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-5);
    }else{
        shapeLayer.position = CGPointMake(self.frame.size.width/2-10, self.frame.size.height/2-10);

    }
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.lineWidth = 10.0f;
    shapeLayer.strokeColor = [CyclicAnnularMolde getColor:color].CGColor;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:shapeLayer.position radius:(self.frame.size.width-40)/2 startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    circlePath.lineCapStyle = kCGLineCapRound;
    circlePath.lineJoinStyle = kCGLineCapRound;
    
    shapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:shapeLayer];

}

@end
