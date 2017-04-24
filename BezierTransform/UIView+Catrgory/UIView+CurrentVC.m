//
//  UIView+CurrentVC.m
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "UIView+CurrentVC.h"
#import <objc/runtime.h>


@implementation UIView (CurrentVC)


#pragma mark - runtime
static const char * CurrentVcKey = "CurrentVcKey";


-(void)setCurrentVc:(UIViewController *)currentVc{
    objc_setAssociatedObject(self, &CurrentVcKey, currentVc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIViewController*)currentVc{
    return objc_getAssociatedObject(self, &CurrentVcKey);
}





@end
