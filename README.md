# NSMutableAttributedString-Simple
Simplify the process of creating NSMutableAttributedString with block. 使用链式调用简化Objective-c富文本创建过程。

    NSMutableAttributedString *test = [NSMutableAttributedString stringWithFormat:@"%@  %@\r\n%@" strings:@[
        @"Test1".setSystemFontSize(28.f).setColorWithName(@"red")
                .setUnderlineStyle(@(NSUnderlineStyleDouble)).setUnderlineColor([UIColor blueColor]),
        @"Test2".setBoldSystemFontSize(25.f).setGreenColor()
                .setStrikelineStyle(@(NSUnderlineStyleThick)).setStrikelineColor([UIColor blueColor]),
        @"Test3".setSystemFontSize(30.f).setColorWithRGB(0xfb8800)
                .setUnderlineStyle(@(NSUnderlinePatternDash | NSUnderlineStyleThick)).setUnderlineColor([UIColor blueColor])
                .setStrikelineStyle(@(NSUnderlineStyleThick)).setStrikelineColor([UIColor blueColor]),
    ]];
    
![image](https://github.com/penoty/NSMutableAttributeString-Simple/blob/master/sample.png )
