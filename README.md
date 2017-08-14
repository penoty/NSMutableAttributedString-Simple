# NSMutableAttributeString-Simple
Simplify the process of creating NSMutableAttributeString with block. 使用链式调用简化Objective-c富文本创建过程。

    NSMutableAttributedString *test = [NSMutableAttributedString stringWithFormat:@"%@  %@\r\n%@" strings:
        @[
          @"test1".setSystemFontSize(12.f).setColorWithName(@"red"),
          @"test2".setBoldSystemFontSize(13.f).setRedColor(),
          @"test4".setSystemFontSize(15.f).setColorWithRGB(0xfb8800)
        ]
    ];
    
![image](https://github.com/penoty/NSMutableAttributeString-Simple/blob/master/sample.png )
