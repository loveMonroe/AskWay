//
//  AKIAMMentorController.m
//  AskWay
//
//  Created by damion on 2017/11/24.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKIAMMentorController.h"

@interface AKIAMMentorController ()

@property (nonatomic, retain) UIButton *button;

@property (nonatomic, retain) UILabel *titleLabel;

@property (nonatomic, retain) UILabel *detailLabel;

@end

@implementation AKIAMMentorController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI and Action

- (void)configUI {
    
    [self.view addSubview:self.button];
}

#pragma mark - Setter and Getter

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(20, 20, screenWidth - 40, 80);
        _button.backgroundColor = LPColorGoldenButton;
        _button.layer.cornerRadius = 5;
        _button.layer.masksToBounds = YES;
        _button.layer.shadowOffset = CGSizeMake(10, 10);
        _button.layer.shadowOpacity = 0.7;
    }
    return _button;
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
