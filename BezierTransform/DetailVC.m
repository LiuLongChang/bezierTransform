//
//  DetailVC.m
//  BezierTransform
//
//  Created by 刘隆昌 on 17/4/23.
//  Copyright © 2017年 刘隆昌. All rights reserved.
//

#import "DetailVC.h"
#import "MacroHeader.h"

@interface DetailVC ()

@property(strong,nonatomic)UIBarButtonItem * rightItem;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = self.rightItem;
}

- (IBAction)normalShowAction:(UIButton *)sender {
    
    GoodSelectView *goodSelectView = [[GoodSelectView alloc] initWithFrame:self.view.bounds];
    goodSelectView.currentVc = self;
    [goodSelectView show];
    //goodSelectView.backgroundColor = [UIColor cyanColor];
    
}


- (IBAction)downShowAction:(UIButton *)sender {
    GoodSelectView * goodSelectView = [[GoodSelectView alloc] initWithFrame:self.view.bounds];
    goodSelectView.currentVc = self;
    [goodSelectView showWith3D:YES];
}


- (IBAction)riseBtnAction:(UIButton *)sender {
    [self closeWithDuration:0.5 transformType:TransformTypeM32];
}


-(UIBarButtonItem*)rightItem{
    if (!_rightItem) {
        UIButton * btn = [[UIButton alloc] init];
        [btn sizeToFit];
        [btn setImage:[UIImage imageNamed:@"shoppingcart"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(gotoShoppingCart:) forControlEvents:UIControlEventTouchUpInside];
        _rightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return _rightItem;
}

-(void)gotoShoppingCart:(UIButton*)btn{
    
    NSLog(@"前往购物车");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
