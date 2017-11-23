//
//  AKBaseViewController.m
//  AskWay
//
//  Created by damion on 2017/11/20.
//  Copyright © 2017年 sky. All rights reserved.
//

#import "AKBaseViewController.h"

@interface AKBaseViewController ()

@end

@implementation AKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //自定义导航栏按钮
    UIBarButtonItem *barButton = [self leftBarButtonItem];
    if (barButton) {
        self.navigationItem.leftBarButtonItem = barButton;
    }
    barButton = [self rightBarButtonItem];
    if (barButton) {
        self.navigationItem.rightBarButtonItem = barButton;
    }
    
    //默认背景色
//    self.view.backgroundColor = LPColorBackground;
    [self initView];
    [self fetchViewData:AKDataLoadFirst];
}

- (instancetype)initWithViewModel:(AKViewModel *)viewModel {
    self = [self init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewWillRelease {
    
}

- (void)initView {
    
}

- (UIBarButtonItem *)backBarButtonItem {
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    barButton.title = @"返回";
    return barButton;
}

- (UIBarButtonItem *)leftBarButtonItem {
    return nil;
}

- (UIBarButtonItem *)rightBarButtonItem {
    return nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.didViewControllerPushed = YES;
    self.navigationItem.backBarButtonItem = [self backBarButtonItem];
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)fetchViewData:(AKDataLoadType)loadType {
    
}

- (void (^)(id, NSUInteger))performBlock {
    return ^(id withObject,NSUInteger withTag) {
        DLogError(@"找不到事件类型：%@",[@(withTag) stringValue]);
    };
}

- (void)performSelectorWithName:(NSString *)selectorName {
    if (selectorName && selectorName.length) {
        SEL selector = NSSelectorFromString(selectorName);
        if ([self respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:selector];
#pragma clang diagnostic pop
        }
    }
}


- (void)dealloc {
    //移除所有通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSString *vcName = NSStringFromClass([self class]);
    DLogWarn(@".................%@释放...............",vcName);
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
