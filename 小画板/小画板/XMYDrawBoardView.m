//
//  XMYDrawBoardView.m
//  小画板
//
//  Created by xmy on 16/8/25.
//  Copyright © 2016年 xmy. All rights reserved.
//

#import "XMYDrawBoardView.h"
#import "XMYBezierPath.h"

@interface XMYDrawBoardView ()
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation XMYDrawBoardView

- (void)clear;
{
    [self.array removeAllObjects];
    //重绘
    [self setNeedsDisplay];
}
- (void)back;
{
    [self.array removeLastObject];
    //重绘
    [self setNeedsDisplay];
}
- (NSMutableArray *)array{
    if(!_array)
    {
        _array = [NSMutableArray array];
    }
    return _array;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //获取触摸对象
    UITouch *t = [touches anyObject];
    //获取手指位置
    CGPoint p = [t locationInView:t.view];
    
    //创建路径
    XMYBezierPath *path = [[XMYBezierPath alloc]init];
    
    //设置线宽
    [path setLineWidth:self.lineWidth1 ? :5];
    //设置颜色
    [path setLineColor:self.lineColor];
    
    //设置线型
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    
    
    //设置起点
    [path moveToPoint:p];
    
    //每条线需要一条路径,添加在数组中
    [_array addObject:path];
    
    
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //获取触摸对象
    UITouch *t = [touches anyObject];
    
    //获取手指位置
    CGPoint p = [t locationInView:t.view];
    
    //设置终点,路径已经存在数组里面了当前的路径应该是数组里面最后一个元素
    [[self.array lastObject] addLineToPoint:p];
    
    //重绘
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //渲染
    for(XMYBezierPath *path in self.array)
    {
        //设置颜色
        [path.lineColor set];
        //渲染
        [path stroke];
    }
    
}

@end
