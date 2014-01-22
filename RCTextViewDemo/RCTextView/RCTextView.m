//
//  MTETextView.m
//  MeTime
//
//  Created by Chao Ruan on 20/12/2013.
//  Copyright (c) 2013 Chao Ruan. All rights reserved.
//

#import "RCTextView.h"

@interface RCTextView()
@property (nonatomic, strong)UILabel *placeholderLable;
@end

@implementation RCTextView
static UIEdgeInsets _padding;
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholderString
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _padding = UIEdgeInsetsMake(5, 5, 5, 5);
        self.contentInset = _padding;
        self.placeholderString = placeholderString;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textChanged:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (UILabel*)placeholderLable
{
    if (!_placeholderLable) {
        _placeholderLable = [[UILabel alloc]initWithFrame:CGRectZero];
        _placeholderLable.font = self.font;
        _placeholderLable.numberOfLines = 0;
        _placeholderLable.backgroundColor = [UIColor clearColor];
        _placeholderLable.textColor = self.placeholderColor;
        _placeholderLable.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_placeholderLable];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:_padding.top]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLable attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:_padding.left]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_placeholderLable attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-_padding.right]];
        
    }
    return _placeholderLable;
}

- (NSString*)placeholderString
{
    if (!_placeholderString) {
        _placeholderString = @"";
    }
    return _placeholderString;
}

- (UIColor*)placeholderColor
{
    if (!_placeholderColor) {
        _placeholderColor = [UIColor lightGrayColor];
    }
    return _placeholderColor;
}

- (void)textChanged:(NSNotification *)notification
{
    if ([self.placeholderString length] != 0) {
        self.placeholderLable.hidden = ([self.text length] != 0) ;
    }
}

- (void)drawRect:(CGRect)rect
{
    if ([self.placeholderString length] > 0) {
        self.placeholderLable.text = self.placeholderString;
        [self.placeholderLable sizeToFit];
    }
    if ([self.text length] == 0 && [self.placeholderString length] > 0) {
        self.placeholderLable.hidden = NO;
    }
    
    [super drawRect:rect];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextViewTextDidChangeNotification
                                                  object:nil];
}
@end
