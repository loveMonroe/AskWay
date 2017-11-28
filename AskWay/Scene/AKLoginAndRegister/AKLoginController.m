//
//  AKLoginController.m
//  AskWay
//
//  Created by damion on 2017/11/28.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKLoginController.h"

@interface AKLoginController ()

@property (nonatomic, strong) LPLimitTextField *accountTextField;

@property (nonatomic, strong) LPLimitTextField *verifyTextField;

@property (nonatomic, strong) UIButton *verifyBtn;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UILabel *protocolLabel;

@end

@implementation AKLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"登录";
    
    [self lp_setAutoKeyBoardEnableOnView:self.view];
    [self lp_tapSpaceHiddenKeyBoard];
    
    [self configUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    UILabel *accountLabel = [AKToolCreateUI createLabel:CGRectMake(16, 56, 44, 20) title:@"手机号" superView:self.view font:AKFontLevel_Four textColor:AKColor_Title];
    
    [self.view addSubview:self.accountTextField];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (weakSelf.view).offset(16);
        make.top.equalTo (accountLabel.mas_bottom).offset(12);
        make.right.equalTo (weakSelf.view).offset(-16);
        make.height.mas_equalTo (24);
    }];
    
    [AKToolCreateUI createUIView:CGRectMake(16, 120, screenWidth - 32, 2) backgroundColor:AKColor_Blue superView:self.view];
    
    UILabel *verifyLabel = [AKToolCreateUI createLabel:CGRectMake(16, 172, 44, 20) title:@"验证码" superView:self.view font:AKFontLevel_Four textColor:AKColor_Title];
    
    [self.view addSubview:self.verifyBtn];
    [self.verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (weakSelf.view).offset(-16);
        make.height.mas_equalTo (20);
        make.centerY.equalTo (verifyLabel);
    }];
    
    [self.view addSubview:self.verifyTextField];
    [self.verifyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.right.equalTo (weakSelf.accountTextField);
        make.top.equalTo (verifyLabel.mas_bottom).offset (12);
    }];
    
    [AKToolCreateUI createUIView:CGRectMake(16, 236, screenWidth - 32, 1) backgroundColor:AKColor_Gray superView:self.view];
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.view).offset(282);
        make.left.equalTo (weakSelf.view).offset(20);
        make.right.equalTo (weakSelf.view).offset(-20);
        make.height.mas_equalTo (49);
    }];
    
    [self.view addSubview:self.protocolLabel];
    [self.protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.loginBtn).offset (67);
        make.height.mas_equalTo (20);
        make.centerX.equalTo (weakSelf.view);
    }];
}

#pragma mark - Get and Set

- (LPLimitTextField *)accountTextField {
    if (!_accountTextField) {
        _accountTextField = [LPLimitTextField limitTextFieldWithFrame:CGRectZero limitType:LPLimitTextFieldTypeByLength limitCount:11];
        _accountTextField.font = S_font(24);
        _accountTextField.inputType = LPLimitInputTypeNumber;
        _accountTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _accountTextField;
}

- (LPLimitTextField *)verifyTextField {
    if (!_verifyTextField) {
        _verifyTextField = [LPLimitTextField limitTextFieldWithFrame:CGRectZero limitType:LPLimitTextFieldTypeByLength limitCount:6];
        _verifyTextField.font = S_font(24);
        _verifyTextField.inputType = LPLimitInputTypeNumber;
        _verifyTextField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _verifyTextField;
}

- (UIButton *)verifyBtn {
    if (!_verifyBtn) {
        _verifyBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_verifyBtn setTintColor:AKColor_Blue];
        [_verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verifyBtn.titleLabel setFont:AKFontLevel_Four];
    }
    return _verifyBtn;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTintColor:LPColorWhite];
        [_loginBtn setBackgroundColor:AKColor_Blue];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn.titleLabel setFont:AKFontLevel_Two];
        _loginBtn.layer.cornerRadius = 24;
    }
    return _loginBtn;
}

- (UILabel *)protocolLabel {
    if (!_protocolLabel) {
        _protocolLabel = [[UILabel alloc] init];
        _protocolLabel.text = @"登录后表示您同意《问道用户协议》";
        _protocolLabel.textColor = AKColor_IgnoreTitle;
        _protocolLabel.font = AKFontLevel_Four;
        _protocolLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _protocolLabel;
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
