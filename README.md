RCTextView
==========

RCTextView is subclass of UITextView which has placeholder, it will work same as the UITextfiled

##Installation

 * Drag the `RCTextView.h`+`RCTextView.m` to your project
 * `#import "RCTextView.h"`
 * That's all :]
 
##Usage

```
RCTextView *textView = [[RCTextView alloc]initWithFrame:CGRectMake(10, 50, 300, 200) placeholder:@"It is a UITextView with placeholder"];
    // Can use your own color for the placeholder
	// textView.placeholderColor = [UIColor myColor];
    [self.view addSubview:textView];
    
```
