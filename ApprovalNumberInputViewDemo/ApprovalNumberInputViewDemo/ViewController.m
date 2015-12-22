//
//  ViewController.m
//  ApprovalNumberInputViewDemo
//
//  Created by chenxin on 15/12/23.
//  Copyright © 2015年 ChenXinApp. All rights reserved.
//

#import "ViewController.h"
#import "ApprovalNumberInputView.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithWhite:240/255.0 alpha:1];
    
    CGRect rect = CGRectInset(self.view.bounds, 15, 40);
    rect.size.height = 40;
    self.textField = [[UITextField alloc] initWithFrame:rect];
    self.textField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.textField];
    
    [ApprovalNumberInputView applyToTextField:self.textField];
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
