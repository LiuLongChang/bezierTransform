//
//  ViewController.m
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "ViewController.h"
#import "MacroHeader.h"


@interface ViewController ()

@end


#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * fallBtn = [[UIButton alloc] initWithFrame:CGRectMake(Width/2-30, 100, 60, 30)];
    [fallBtn setTitle:@"下沉" forState:UIControlStateNormal];
    [fallBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [fallBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [fallBtn addTarget:self action:@selector(fall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fallBtn];
    
    UIButton *riseBtn = [[UIButton alloc] initWithFrame:CGRectMake(Width/2-30, Height-200, 60, 30)];
    [riseBtn setTitle:@"上升" forState:UIControlStateNormal];
    [riseBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [riseBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [riseBtn addTarget:self action:@selector(rise) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:riseBtn];
    
}

-(void)fall{
    [self showWithDuration:0.5 transformType:TransformType34];
}

-(void)rise{
    [self closeWithDuration:0.5 transformType:TransformType34];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recre
}


@end
