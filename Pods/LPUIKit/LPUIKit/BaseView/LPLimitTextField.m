//
//  LPLimitTextField.m
//  WSXDM
//
//  Created by wangshen on 17/2/17.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "LPLimitTextField.h"

@interface LPLimitTextField () <UITextFieldDelegate>


/**
 代理方法
 */
@property (nonatomic, weak) id<UITextFieldDelegate> limitDelegate;


/**
 保存输入规则的 字典
 */
@property (nonatomic, strong) NSDictionary *regularDictionary;

/**
 输入框中上一次输入的文字
 */
@property (nonatomic, copy) NSString *oldTextString;

@end

@implementation LPLimitTextField

- (void)dealloc {
    
    NSLog(@"LPLimitTextField 释放 －－－－ ");
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self _addTextFieldChangeObserver];
        [self _initlizedProperties];
//        self.delegate = self;
    }
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self _addTextFieldChangeObserver];
        [self _initlizedProperties];
//        self.delegate = self;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self _addTextFieldChangeObserver];
        [self _initlizedProperties];
//        self.delegate = self;
    }
    return self;
}

#pragma mark - setter
//- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
//    
//    if (delegate == (id<UITextFieldDelegate>)self) {
//        
//        super.delegate = (id<UITextFieldDelegate>)self;
//    }else {
//        self.limitDelegate = delegate;
//        
//    }
//    
//}



#pragma mark - Public Function
+ (instancetype)limitTextFieldWithFrame:(CGRect)frame limitType:(LPLimitTextFieldType)limitType limitCount:(NSInteger)limitCount {
    
    LPLimitTextField *textField = [[[self class] alloc] initWithFrame:frame];
    textField.limitType = limitType;
    textField.limitCount = limitCount;
    return textField;
}


#pragma mark - 初始化数据
- (void)_initlizedProperties {
    
    self.limitType = LPLimitTextFieldTypeByLength;
    self.limitCount = 0;
    self.regularDictionary = @{@"2":@"[0-9]*",
                               @"3":@"[a-zA-Z]*",
                               @"4":@"[0-9]{0,}(\\.([0-9]{0,2})){0,1}",
                               @"5":@"[a-zA-Z0-9]*"};
}


#pragma mark - 添加通知
- (void)_addTextFieldChangeObserver {
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [self addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
}

//- (void)_removeNotification {
//
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
//}



#pragma mark - Action
- (void)textFieldDidChanged:(UITextField *)sender {
    
    if (self.markedTextRange) {
        return ;
    }
    
    BOOL isValid = [self _judgeInputIsValidWithString:self.text];
    if (!isValid) {
        self.text = self.oldTextString;
        return ;
    }
    
    if (self.limitCount <= 0) {
        self.oldTextString = self.text;
        return ;
    }
    
    
    NSString *currentString = self.text;
    if(self.limitType == LPLimitTextFieldTypeByLength) {
        NSInteger length = self.text.length;
        if (length > self.limitCount) {
            self.text = [currentString substringToIndex:self.limitCount];
        }
        self.oldTextString = self.text;
    }else if (self.limitType == LPLimitTextFieldTypeByDoubleByte) {
        NSInteger count = [self _calcuteBytesWithString:currentString];
        if (count > self.limitCount) {
            NSString *resultString = [self _subStringWithString:currentString count:self.limitCount];
            self.text = resultString;
        }
        self.oldTextString = self.text;
    }
}


#pragma mark - UITextField Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //如果 代理存在  则在外部处理
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        
        return [self.limitDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }else {
        
        
        if (string.length == 0) { //如果是删除的话  返回YES
            return YES;
        }else {
            
            NSString *resultText = [textField.text stringByReplacingCharactersInRange:range withString:string];
            return [self _judgeInputIsValidWithString:resultText];
        }
    }
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [self.limitDelegate textFieldShouldClear:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.limitDelegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.limitDelegate textFieldShouldReturn:textField];
    }
    [self resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.limitDelegate textFieldDidBeginEditing:textField];
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.limitDelegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.limitDelegate textFieldShouldEndEditing:textField];
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    
    if (self.limitDelegate && [self.limitDelegate respondsToSelector:@selector(textFieldDidEndEditing:reason:)]) {
        [self.limitDelegate textFieldDidEndEditing:textField reason:reason];
    }
}




#pragma mark - 私有方法

/**
 计算字符串的长度 按双字节算
 
 @param string 需要计算的字符串
 @return 长度
 */
- (NSInteger )_calcuteBytesWithString:(NSString *)string {
    int i,n=(int)[string length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[string characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}


/**
 截取 字符串
 
 @param string 被截取的字符串
 @param count  截取的长度
 @return   string
 */
- (NSString*)_subStringWithString:(NSString *)string count:(NSInteger )count {
    int maxLength = (int)count;
    int i,n=(int)[string length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[string characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
        int length = l+(int)ceilf((float)(a+b)/2.0);
        if (length == maxLength + 1) {
            NSString *str = [string substringToIndex:i];
            return str;
        }
    }
    return string;
}


- (BOOL)_stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f924) {
                                            returnValue = YES;
                                        }
                                    }
                                }else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3 || ls == 0xFE0F || ls == 0xd83c) {
                                        returnValue = YES;
                                    }
                                }else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        if (0x278b <= hs && 0x2792 >= hs) {
                                            returnValue = NO;
                                        }else {
                                            returnValue = YES;
                                        }
                                    }else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    }else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    }else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    }else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0xd83e) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    return returnValue;
}


- (BOOL)_judgeInputIsValidWithString:(NSString *)string {
    
    
    BOOL shouldInput = NO;
    if (self.inputType == LPLimitInputTypeNone) {
        return YES;
    }else if(self.inputType == LPLimitInputTypeNoEmoji){
        return ![self _stringContainsEmoji:string];
    }else {
        NSString *key = [NSString stringWithFormat:@"%zd",self.inputType];
        NSString *regularString = [self.regularDictionary objectForKey:key];    //正则表达式限制输入
        if (!regularString.length) {
            shouldInput = YES;
        }else {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regularString];
            shouldInput = [predicate evaluateWithObject:string];
        }
    }
    return shouldInput;
}


#pragma mark - setter
- (void)setCustomRegular:(NSString *)customRegular {
    
    _customRegular = customRegular;
    if (customRegular) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:self.regularDictionary];
        NSString *keyString = [NSString stringWithFormat:@"%zd",LPLimitInputTypeCustom];
        [dictionary setObject:customRegular forKey:keyString];
        self.regularDictionary = [NSDictionary dictionaryWithDictionary:dictionary];
    }
}


@end
