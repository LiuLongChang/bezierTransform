//
//  UIViewController+The3DFailAndRise.h
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TransformType){
    TransformTypeM32 = 0,
    TransformType34,
};


@interface UIViewController (The3DFailAndRise)


/*3D形变展示*/
-(void)show;
/*3D形变关闭*/
-(void)close;
/*
 3D形变展示
 
 @param duration 时长
 */
-(void)showWithDuration:(NSTimeInterval)duration;
/*
 3D形变关闭
 @param duration 时长
 */
-(void)closeWithDuration:(NSTimeInterval)duration;

/*
 3D形变展示
 @param duration 时长
 @param type 动画类型
 */
-(void)showWithDuration:(NSTimeInterval)duration transformType:(TransformType)type;

/*
 3D形变关闭
 @param duration 时长
 @param type 动画类型
 */
-(void)closeWithDuration:(NSTimeInterval)duration transformType:(TransformType)type;



@end
