//
//  UIViewController+The3DFailAndRise.m
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "UIViewController+The3DFailAndRise.h"

@implementation UIViewController (The3DFailAndRise)



-(void)show{
    [self fallVcWithDuration:0.5f transformType:TransformType34];
}

-(void)showWithDuration:(NSTimeInterval)duration{
    [self fallVcWithDuration:duration transformType:TransformType34];
}

-(void)close{
    [self riseVcWithDuration:0.5f transformType:TransformType34];
}


-(void)closeWithDuration:(NSTimeInterval)duration{
    [self riseVcWithDuration:duration transformType:TransformType34];
}

/*==============  */
-(void)showWithDuration:(NSTimeInterval)duration transformType:(TransformType)type{
    [self fallVcWithDuration:duration transformType:type];
}

/*============== */
-(void)closeWithDuration:(NSTimeInterval)duration transformType:(TransformType)type{
    [self riseVcWithDuration:0.5f transformType:type];
}



-(void)riseVcWithDuration:(NSTimeInterval)duration transformType:(TransformType)type{

    UIViewController * controller = [self getActionController];
    
    [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [controller.view.layer setTransform:[self firstTransformType:type]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [controller.view.layer setTransform:CATransform3DIdentity];
            
        } completion:^(BOOL finished) {
            
            
        }];
        
    }];
    
    


}


-(void)fallVcWithDuration:(NSTimeInterval)duration transformType:(TransformType)type{
    
    UIViewController* controller = [self getActionController];
    
    [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [controller.view.layer setTransform:[self firstTransformType:type]];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:duration/2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [controller.view.layer setTransform:[self secondTransformType:type]];
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];
    
}



-(CATransform3D)firstTransformType:(TransformType)type{
    CATransform3D t1 = CATransform3DIdentity;
    CGFloat m = 1.0/-900;
    switch (type) {
        case TransformTypeM32:
            t1.m32 = m;
            break;
        default:
            t1.m34 = m;
            break;
    }
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    t1 = CATransform3DRotate(t1, 15.0*M_PI/180.0, 1, 0, 0);
    return t1;
}





-(CATransform3D)secondTransformType:(TransformType)type{
    CATransform3D t2 = CATransform3DIdentity;
    switch (type) {
        case TransformTypeM32:
            t2.m32 = [self firstTransformType:type].m32;
            break;
        default:
            t2.m34 = [self firstTransformType:type].m34;
            break;
    }
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, 0.80, 0.80, 1);
    return t2;
}


-(UIViewController*)getActionController{
    return self.navigationController ? self.navigationController : self;
}















@end
