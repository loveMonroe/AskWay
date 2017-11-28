//
//  AKNicknameController.m
//  AskWay
//
//  Created by damion on 2017/11/28.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKNicknameController.h"

@interface AKNicknameController ()

@property (nonatomic, strong) LPLimitTextField *nameTextField;

@end

@implementation AKNicknameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"昵称";
    
    [self lp_setupNavRightItemWithTitle:@"确认" color:AKColor_Blue action:@selector(ensure:)];
    
    [self configUI];
    
    [self lp_tapSpaceHiddenKeyBoard];
}

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.view).offset (24);
        make.left.equalTo (weakSelf.view).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.view).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (16);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = LPColorLine;
    [self.view addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.nameTextField.mas_bottom).offset (12);
        make.left.right.equalTo (weakSelf.nameTextField);
        make.height.mas_equalTo (1/screenScale);
    }];
}

- (void)ensure:(id)sender {
    
}

#pragma mark - Set and Get

- (LPLimitTextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [LPLimitTextField limitTextFieldWithFrame:CGRectZero limitType:LPLimitTextFieldTypeByLength limitCount:10];
        _nameTextField.placeholder = @"请输入昵称";
        _nameTextField.font = AKFontLevel_Two;
    }
    return _nameTextField;
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
