# NSMutableAttributedString-Simple
Simplify the process of creating NSMutableAttributedString with block. 使用链式调用简化Objective-c富文本创建过程。

    NSMutableAttributedString *attributedStr = [NSMutableAttributedString stringWithFormat:@"%@\r\n%@\r\n%@" strings:@[
        @"Test1".setBackgroundColor([UIColor redColor]).setSystemFontSize(20.f).setColor([UIColor blueColor]),
        @"Test2".setUnderlineColor([UIColor yellowColor]).setUnderlineStyle(@(NSUnderlineStyleThick))
                .setSystemFontSize(30.f).setColorWithRGB(0xfb8800),
        @"Test3".setStrikelineStyle(@(NSUnderlineStyleThick)).setStrikelineColor([UIColor blueColor])
    ]];
    
![image](https://github.com/penoty/NSMutableAttributeString-Simple/blob/master/test.png )
