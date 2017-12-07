//
//  AKPublishController.m
//  AskWay
//
//  Created by damion on 2017/12/5.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKPublishController.h"

#import "AKTagsView.h"

@interface AKPublishController () <AKTagsViewDelegate, UITextViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) UIView *scrollContentView;

@property (nonatomic, retain) AKTagsView *tagsView;

@property (nonatomic, retain) UITextView *quzDetailTextView;

@property (nonatomic, retain) UILabel *tipsLabel;

@property (nonatomic, retain) UILabel *remainLabel;

@property (nonatomic, retain) LPLimitTextField *commissionTextField;

@end

@implementation AKPublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"发布问题";
    
    [self lp_setupNavLeftItemWithTitle:@"取消" action:@selector(_cancleQuz:)];
    [self lp_setupNavRightItemWithTitle:@"发布" color:AKColor_Blue action:@selector(_publishQuz:)];
    
    [self configUI];
    
    [self lp_setAutoKeyBoardEnable];
    [self lp_tapSpaceHiddenKeyBoard];
}

#pragma mark - UI and Action

- (void)configUI {
    
    WEAKSELF
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(weakSelf.mas_topLayoutGuideBottom);
        make.left.bottom.right.equalTo(weakSelf.view);
    }];
    
    [self.scrollView addSubview:self.scrollContentView];
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make){
        make.edges.equalTo(weakSelf.scrollView);
        make.width.equalTo(weakSelf.scrollView);
    }];
    
    UILabel *label1 = [AKToolCreateUI createLabel:CGRectZero title:@"请选择问题类型" superView:self.scrollContentView font:S_font(14) textColor:AKColor_Title];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.scrollContentView).offset (20);
        make.left.equalTo (weakSelf.scrollContentView).offset (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (20);
    }];
    
    NSArray *array = @[@"职业规划", @"专业学习", @"面试指导",
                       @"简历指导"];
    self.tagsView.tagsArray = array;
    [self.scrollContentView addSubview:self.tagsView];
    [self.tagsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (label1.mas_bottom).offset (12);
        make.left.equalTo (weakSelf.scrollContentView).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
    }];
    
    UILabel *label2 = [AKToolCreateUI createLabel:CGRectZero title:@"问题描述" superView:self.scrollContentView font:S_font(14) textColor:AKColor_Title];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.tagsView.mas_bottom).offset (32);
        make.left.equalTo (weakSelf.tagsView);
        make.height.mas_equalTo (20);
    }];
    
    [self.scrollContentView addSubview:self.quzDetailTextView];
    [self.quzDetailTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (label2.mas_bottom).offset (12);
        make.left.equalTo (label2);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (200);
    }];
    
    [self.quzDetailTextView addSubview:self.tipsLabel];
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo (weakSelf.quzDetailTextView).offset (12);
        make.width.mas_equalTo (screenWidth - 28 * 2);
    }];
    
    [self.scrollContentView addSubview:self.remainLabel];
    [self.remainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo (weakSelf.quzDetailTextView).offset (-8);
        make.bottom.equalTo (weakSelf.quzDetailTextView).offset (-8);
        make.height.mas_equalTo (17);
    }];
    
    UILabel *label3 = [AKToolCreateUI createLabel:CGRectZero title:@"酬金设置" superView:self.scrollContentView font:S_font(14) textColor:AKColor_Title];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.quzDetailTextView.mas_bottom).offset (32);
        make.left.equalTo (weakSelf.quzDetailTextView);
        make.height.mas_equalTo (20);
    }];
    
    [self.scrollContentView addSubview:self.commissionTextField];
    [self.commissionTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (label3.mas_bottom).offset (12);
        make.left.equalTo (weakSelf.scrollContentView).offset (LPSpaceHorizontalEdge);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (50);
    }];
    
    UILabel *label4 = [AKToolCreateUI createLabel:CGRectZero title:@"元" superView:self.commissionTextField font:S_font(16) textColor:AKColor_Title];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (weakSelf.commissionTextField);
        make.right.equalTo (weakSelf.commissionTextField).offset (-12);
        make.height.mas_equalTo (22);
    }];
    
    UILabel *label5 = [AKToolCreateUI createLabel:CGRectZero title:@"问题有效时间：24小时" superView:self.scrollContentView font:S_font(12) textColor:AKColor_IgnoreTitle];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo (weakSelf.scrollContentView).offset (-20);
        make.centerX.equalTo (weakSelf.scrollContentView);
        make.height.mas_equalTo (17);
        CGFloat topGap = 112;
        if (iPhone6P) {
            topGap = 181;
        } else if (iPhone5 || iPhone4) {
            topGap = 13;
        }
        make.top.equalTo (weakSelf.commissionTextField.mas_bottom).offset (topGap);
    }];
    
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo (label5.mas_bottom).offset (20);
    }];
}

- (void)_publishQuz:(id)sender {
    
}

- (void)_cancleQuz:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    self.tipsLabel.hidden = YES;
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    self.tipsLabel.hidden = textView.text.length;
    return YES;
}

#pragma mark - Set and Get

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
    }
    return _scrollView;
}

- (UIView *)scrollContentView {
    if (!_scrollContentView) {
        _scrollContentView = [UIView new];
    }
    return _scrollContentView;
}

- (AKTagsView *)tagsView {
    if (!_tagsView) {
        _tagsView = [[AKTagsView alloc] initWithFrame:CGRectMake(0, 0, screenWidth - LPSpaceHorizontalEdge *2, 0)];
        _tagsView.allowEmptySelection = NO;
        _tagsView.tagcornerRadius = 10;
        _tagsView.tagBorderWidth = 0.5;
        _tagsView.tagHeight = 24;
        _tagsView.maximumNumberOfSelection = 5;
        _tagsView.lineSpacing = LPSpaceHorizontalEdge;
        _tagsView.interitemSpacing = 12;
        _tagsView.tagInsets = UIEdgeInsetsMake(6, 8, 6, 8);
        _tagsView.allowsMultipleSelection = YES;
        _tagsView.tagBorderColor = AKColor_Gray;
        _tagsView.tagTextColor = AKColor_IgnoreTitle;
        _tagsView.tagBackgroundColor = LPColorWhite;
        _tagsView.tagFont = S_font(13);
        _tagsView.tagSelectedBorderColor = AKColor_Blue;
        _tagsView.tagSelectedTextColor = AKColor_Blue;
        _tagsView.tagSelectedBackgroundColor = LPColorWhite;
        _tagsView.tagSelectedFont = S_font(13);
        _tagsView.contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _tagsView;
}

- (UITextView *)quzDetailTextView {
    if (!_quzDetailTextView) {
        _quzDetailTextView = [UITextView new];
        _quzDetailTextView.textContainerInset = UIEdgeInsetsMake(12, 12, 12, 12);
        _quzDetailTextView.layer.masksToBounds = YES;
        _quzDetailTextView.layer.cornerRadius = 8;
        _quzDetailTextView.layer.borderColor = AKColor_Gray.CGColor;
        _quzDetailTextView.layer.borderWidth = 0.5;
        _quzDetailTextView.delegate = self;
        _quzDetailTextView.font = S_font(16);
    }
    return _quzDetailTextView;
}

- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [AKToolCreateUI createLabel:CGRectZero title:@"请详细描述你的现状、已掌握的技能和经验、你的性格特点、你对未来工作的预期" superView:nil font:S_font(16) textColor:AKColor_Gray];
        _tipsLabel.numberOfLines = 0;
    }
    return _tipsLabel;
}

- (UILabel *)remainLabel {
    if (!_remainLabel) {
        _remainLabel = [AKToolCreateUI createLabel:CGRectZero title:@"0/300" superView:nil font:S_font(12) textColor:AKColor_Gray];
        _remainLabel.numberOfLines = 0;
    }
    return _remainLabel;
}

- (LPLimitTextField *)commissionTextField {
    if (!_commissionTextField) {
        _commissionTextField = [LPLimitTextField limitTextFieldWithFrame:CGRectZero limitType:LPLimitTextFieldTypeByLength limitCount:3];
        _commissionTextField.font = S_font(16);
        _commissionTextField.inputType = LPLimitInputTypeNumber;
        _commissionTextField.keyboardType = UIKeyboardTypeNumberPad;
        _commissionTextField.textColor = AKColor_Gray;
        _commissionTextField.placeholder = @"输入1-100元之间的整数";
        //设置左边视图的宽度
        _commissionTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 12, 0)];
        //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
        _commissionTextField.leftViewMode = UITextFieldViewModeAlways;
        _commissionTextField.layer.masksToBounds = YES;
        _commissionTextField.layer.cornerRadius = 8;
        _commissionTextField.layer.borderColor = AKColor_Gray.CGColor;
        _commissionTextField.layer.borderWidth = 0.5;
    }
    return _commissionTextField;
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
