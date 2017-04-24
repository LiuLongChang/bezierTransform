//
//  UIView+Views.h
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Views)


-(void)addHeadSeparator:(UIColor*)color;

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;
@property(nonatomic,assign,readonly)CGFloat maxY;
@property(nonatomic,assign,readonly)CGFloat maxX;


-(void)removeAllSubviews;

@property(nonatomic,weak)UIViewController* viewController;
@property(nonatomic,weak)UINavigationController * navigationController;

+(UILabel*)copyLabel:(UILabel*)label;
+(UIButton*)copyButton:(UIButton*)button;
+(UITextField*)copyTextField:(UITextField*)label;
/*
    收起键盘
 */
-(void)packUpKeyboard;


@end
