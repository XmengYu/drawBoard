//
//  XMYDrawBoardView.h
//  小画板
//
//  Created by xmy on 16/8/25.
//  Copyright © 2016年 xmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMYDrawBoardView : UIView
@property(assign,nonatomic)float lineWidth1;
@property(strong,nonatomic)UIColor *lineColor;

- (void)clear;
- (void)back;
@end
