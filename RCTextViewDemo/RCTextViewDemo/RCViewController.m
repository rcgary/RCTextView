//
//  RCViewController.m
//  RCTextViewDemo
//
//  Created by Chao Ruan on 16/01/2014.
//  Copyright (c) 2014 Chao Ruan. All rights reserved.
//

#import "RCViewController.h"
#import "RCTextView.h"

@interface RCViewController ()
@end

@implementation RCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RCTextView *textView = [[RCTextView alloc]initWithFrame:CGRectMake(10, 50, 300, 200) placeholder:@"It is a UITextView with placeholder"];
    // Can use your own color for the placeholder
//    textView.placeholderColor = [UIColor myColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
