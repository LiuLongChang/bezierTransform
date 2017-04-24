//
//  GoodSelectView.m
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "GoodSelectView.h"
#import "MacroHeader.h"

@interface GoodSelectView()

@property(nonatomic,strong)UIView* mainView;
@property(nonatomic,strong)UIView* blackBackground;
@property(nonatomic,strong)UIImageView* goodImage;
@property(nonatomic,assign)BOOL show3D;

@end


#define ProgressTime 0.5
#define MainViewH 400


@implementation GoodSelectView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow addSubview:self];
        self.backgroundColor = CGColors(0, 0, 0, 0);
        [self setupUI];
        
    }
    return self;
}

-(void)dismiss{
    [self dismissWith3D:self.show3D];
}

-(void)setupUI{
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, Width, MainViewH)];
    _mainView.backgroundColor = [UIColor whiteColor];
    
    _blackBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    _blackBackground.backgroundColor = CGColors(0, 0, 0, 0);
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    tapGr.cancelsTouchesInView = NO;
    [_blackBackground addGestureRecognizer:tapGr];
    
    
    _goodImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, -10, 100, 100)];
    _goodImage.layer.masksToBounds = YES;
    [_goodImage.layer setCornerRadius:3.0];
    [_goodImage.layer setBorderWidth:1];
    [_goodImage.layer setBorderColor:CGColor(230, 230, 230).CGColor];
    [_goodImage setImage:[UIImage imageNamed:@"jingyefu"]];
    [_goodImage setContentMode:UIViewContentModeScaleAspectFill];
    
    
    [_mainView addSubview:_goodImage];
    [self addSubview:_blackBackground];
    [self addSubview:_mainView];
    
    //底部按钮
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 340, Width, 60)];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UIButton *addCartBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addCartBtn.frame = CGRectMake(0, 10, Width/2, 50);
    addCartBtn.backgroundColor = CGColor(207, 174, 113);
    [addCartBtn setTitle:@"加入订购车" forState:UIControlStateNormal];
    [addCartBtn setTitleColor:CGColor(245, 245, 245) forState:UIControlStateNormal];
    [addCartBtn addTarget:self action:@selector(addToShoppingCart) forControlEvents:UIControlEventTouchUpInside];
    addCartBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    
    UIButton * buyBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buyBtn.frame = CGRectMake(Width/2, 10, Width/2, 50);
    buyBtn.backgroundColor = CGColor(221, 96, 88);
    [buyBtn setTitle:@"立即订购" forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [bottomView addSubview:addCartBtn];
    [bottomView addSubview:buyBtn];
    [_mainView addSubview:bottomView];
    
}




-(void)addToShoppingCart{
    
    NSLog(@"加入购物车");
    NSTimeInterval duration = ProgressTime * 1.5;
    
    [UIView animateWithDuration:duration animations:^{
       
        
        [self.goodImage animationWithTwoControlPointsBezierPathTransformEndType:TypeNavRightItemPoint parabolaType:ParabolaTypeDownAndUp duration:duration];
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissWith3D:self.show3D];
            });
        }
        
    }];
}


-(void)buy{
    NSLog(@"立即订购");
}


-(void)show{
    [self showWith3D:self.show3D];
}


-(void)showWith3D:(BOOL)isYes{
    self.show3D = isYes;
    if (isYes) {
        [self.currentVc showWithDuration:ProgressTime];
    }
    [UIView animateWithDuration:ProgressTime animations:^{
        
        self.mainView.y -= MainViewH;
        self.blackBackground.backgroundColor = CGColors(0, 0, 0, 0.5);
        
    } completion:^(BOOL finished) {
        
    }];

}

-(void)dismissWith3D:(BOOL)isYes{
    self.show3D = isYes;
    if (isYes) {
        [self.currentVc closeWithDuration:ProgressTime];
    }
    
    [UIView animateWithDuration:ProgressTime animations:^{
        
        self.mainView.y += MainViewH;
        CGColors(0, 0, 0, 0);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];

}











@end
