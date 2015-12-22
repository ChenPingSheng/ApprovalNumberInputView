//
//  ApprovalNumberInputView.m
//  WYYSS
//
//  Created by chenxin on 15/12/22.
//  Copyright © 2015年 WYYSS. All rights reserved.
//

#import "ApprovalNumberInputView.h"

@interface ApprovalNumberInputView ()

@property (weak, nonatomic) IBOutlet UIView *accessoryView;
@property (weak, nonatomic) UITextField *textField;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keyboardButtons;
@property (weak, nonatomic) IBOutlet UIButton *leftAccessoryButton;
@property (weak, nonatomic) IBOutlet UIButton *rightAccessoryButton;

@end

@implementation ApprovalNumberInputView

+ (instancetype)viewWithOwner:(id)owner forTextField:(UITextField*)textField {
    ApprovalNumberInputView *view = [[[NSBundle mainBundle] loadNibNamed:@"ApprovalNumberInputView" owner:owner options:nil] firstObject];
    
    textField.inputView = view;
    textField.inputAccessoryView = view.accessoryView;
    view.textField = textField;
    
//    [view accessoryButtonAction:view.leftAccessoryButton];
    return view;
}

- (void)awakeFromNib {
    
    [self.leftAccessoryButton addTarget:self action:@selector(accessoryButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightAccessoryButton addTarget:self action:@selector(accessoryButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIButton *button in self.keyboardButtons) {
        button.layer.cornerRadius = 4;
        [button addTarget:self action:@selector(keyboardButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)accessoryButtonAction:(UIButton*)button {
    if (button == self.leftAccessoryButton) {
        self.leftAccessoryButton.selected = YES;
        self.rightAccessoryButton.selected = NO;
    }
    else {
        self.leftAccessoryButton.selected = NO;
        self.rightAccessoryButton.selected = YES;
    }
    NSString *text = [button titleForState:UIControlStateNormal];
    self.textField.text = text;
}

- (void)keyboardButtonAction:(UIButton*)button {
    
    NSString *text = [button titleForState:UIControlStateNormal];
    if ([text isEqualToString:@"删除"]) {
        NSString *oldText = self.textField.text;
        if (oldText.length > 0) {
            NSString *lastString = [oldText substringFromIndex:oldText.length - 1];
            if (![lastString isEqualToString:@"字"]) {
                self.textField.text = [oldText substringToIndex:oldText.length - 1];
            }
        }
    }
    else if ([text isEqualToString:@"确认"]) {
        [self.textField resignFirstResponder];
    }
    else {
        NSString *oldText = self.textField.text;
        self.textField.text = [oldText stringByAppendingString:text];
    }
}

@end
