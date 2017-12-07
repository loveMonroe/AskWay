//
//  AKGoodAtFieldController.m
//  AskWay
//
//  Created by damion on 2017/12/5.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKGoodAtFieldController.h"

#import "AKTagsView.h"

@interface AKGoodAtFieldController () <AKTagsViewDelegate>

@property (nonatomic, retain) UIScrollView *scrollView;

@property (nonatomic, retain) UIView *scrollContentView;

@property (nonatomic, retain) AKTagsView *tagsView;

@property (nonatomic, retain) LPLimitTextField *textField;

@property (nonatomic, retain) UIButton *addBtn;

@property (nonatomic, retain) NSArray *dataArray;

@end

@implementation AKGoodAtFieldController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self lp_setupNavRightItemWithTitle:@"保存" action:@selector(_commitChange:)];
    
    [self configUI];
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
    
    UILabel *titleLabel = [AKToolCreateUI createLabel:CGRectZero title:@"请选择1-5个擅长领域" superView:self.scrollContentView font:S_font(14) textColor:AKColor_Title];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.scrollContentView).offset (24);
        make.left.equalTo (weakSelf.scrollContentView).offset (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (21);
    }];
    
    self.dataArray = @[@"麻棉连衣裙", @"面条", @"亲子装",
                       @"卫生巾", @"米", @"眉笔", @"蛋糕",
                       @"面包", @"洗洁精", @"咖啡速溶",
                       @"云南白药牙膏", @"方便面", @"空调", @"AA"];
    self.tagsView.tagsArray = self.dataArray;
    
    [self.scrollContentView addSubview:self.tagsView];
    [self.tagsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (titleLabel.mas_bottom).offset (LPSpaceHorizontalEdge);
        make.left.equalTo (titleLabel);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
    }];
    
    UILabel *titleLabel2 = [AKToolCreateUI createLabel:CGRectZero title:@"没找到想要的擅长领域？可在下方手动添加" superView:self.scrollContentView font:S_font(14) textColor:AKColor_Title];
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.tagsView.mas_bottom).offset (50);
        make.left.equalTo (weakSelf.scrollContentView).offset (LPSpaceHorizontalEdge);
        make.height.mas_equalTo (21);
    }];
    
    [self.scrollContentView addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (titleLabel2);
        make.top.equalTo (titleLabel2.mas_bottom).offset (24);
        make.height.mas_equalTo (16);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
    }];
    
    [self.scrollContentView addSubview:self.addBtn];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo (weakSelf.textField);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (16);
    }];
    
    UIView *line = [AKToolCreateUI createUIView:CGRectZero backgroundColor:AKColor_Gray superView:self.scrollContentView];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo (weakSelf.textField.mas_bottom).offset (12);
        make.left.equalTo (weakSelf.textField);
        make.right.equalTo (weakSelf.scrollContentView).offset (-LPSpaceHorizontalEdge);
        make.height.mas_equalTo (0.5);
    }];
    
    [self.scrollContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo (line.mas_bottom).offset (LPSpaceHorizontalEdge);
    }];
}

- (void)_addNewTag:(id)sender {
    NSString *newTag = _textField.text;
    if (![NSString isBlankString:newTag]) {
        [self.tagsView addTag:newTag];
    }
}

- (void)_commitChange:(id)sender {
    
}

#pragma mark - AKTagsViewDelegate

- (void)tagsViewDidBeyondMaximumNumberOfSelection:(AKTagsView *)tagsView {
    
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
        _tagsView = [[AKTagsView alloc] initWithFrame:CGRectMake(0, 0, screenWidth - LPSpaceHorizontalEdge * 2, 0)];
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

- (LPLimitTextField *)textField {
    if (!_textField) {
        _textField = [LPLimitTextField limitTextFieldWithFrame:CGRectZero limitType:LPLimitTextFieldTypeByLength limitCount:11];
        _textField.font = S_font(16);
        _textField.inputType = LPLimitInputTypeNoEmoji;
        _textField.textColor = AKColor_Gray;
        _textField.placeholder = @"请输入你的擅长领域";
    }
    return _textField;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_addBtn setTitle:@"添加" forState:UIControlStateNormal];
        [_addBtn setTintColor:AKColor_Blue];
        _addBtn.titleLabel.font = S_font(16);
        [_addBtn addTarget:self action:@selector(_addNewTag:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
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
