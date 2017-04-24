//
//  UIImageView+BezierTransform.h
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import <UIKit/UIKit.h>


/*位移的结束点类型*/

typedef NS_ENUM(NSInteger,TransformEndType){
    /*结束点 : 导航条的右上角*/
    TypeNavRightItemPoint = 0,
    /*结束点 : Tabbar的第三个(从0开始)*/
    TypeTabBarIndex3Point = 1,
    /*结束点 : 与选中图片对称*/
    TypeSymmetricWithImage = 2,
    /*结束点 : 自定义结束点 需要设提前endPoint与radianHeight*/
    TypeCustomPoint = 3,
};


/*贝塞尔抛物线类型*/
typedef NS_ENUM(NSInteger,ParabolType) {
    /*上顶点*/
    ParabolaTypeUp = 0,
    /*先下后上*/
    ParabolaTypeDownAndUp = 1,
    /*先上后下*/
    ParabolaTypeUpAndDown = 2,
};




/*UIImageView + Category : 图片做贝塞尔*/
@interface UIImageView (BezierTransform)


/*结束点*/
@property(nonatomic,assign)CGPoint endPoint;
/*弧度高度(用来控制贝塞尔路径中点)*/
@property(nonatomic,assign)CGFloat radianHeight;


/*
 图片做贝塞尔路径的形变位移便捷方法
 @param transformType 位移的结束点类型
 */

-(void)animationWithBezierPathTransformEndType:(TransformEndType)transformType duration:(NSTimeInterval)duration;



/*
 图片做多控制点贝塞尔路径的形变位移标准方法
 */
-(void)animationWithBezierPathTransformEndType:(TransformEndType)transformType duration:(NSTimeInterval)duration;

/*
 图片做多控制点贝塞尔路径的形变位移扩展方法
 */
-(void)animationWithTwoControlPointsBezierPathTransformEndType:(TransformEndType)transformType parabolaType:(ParabolType)parabolaType duration:(NSTimeInterval)duration;




@end
