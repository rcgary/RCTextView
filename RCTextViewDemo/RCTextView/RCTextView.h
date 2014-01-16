//
//  MTETextView.h
//  MeTime
//
//  Created by Chao Ruan on 20/12/2013.
//  Copyright (c) 2013 Chao Ruan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCTextView : UITextView

- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder;

@property (nonatomic, strong) NSString *placeholderString; // Default is @"" - empty string
@property (nonatomic, strong) UIColor *placeholderColor; // Default is [UIColor lightGrayColor]
@end
