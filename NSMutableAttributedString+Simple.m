//
//  NSMutableAttributedString+Simple.m
//  reocar_ios
//
//  Created by penoty yu on 09/08/2017.
//  Copyright © 2017 reocar. All rights reserved.
//

#import "NSMutableAttributedString+Simple.h"

@implementation NSString (Simple)
@dynamic setFont;
@dynamic setSystemFontSize;
@dynamic setBoldSystemFontSize;
@dynamic font;

@dynamic setColor;
@dynamic color;
@dynamic setColorWithRGB;
@dynamic setColorWithName;
@dynamic setBlackColor;
@dynamic setDarkGrayColor;
@dynamic setLightGrayColor;
@dynamic setWhiteColor;
@dynamic setGrayColor;
@dynamic setRedColor;
@dynamic setGreenColor;
@dynamic setBlueColor;
@dynamic setCyanColor;
@dynamic setYellowColor;
@dynamic setMagentaColor;
@dynamic setOrangeColor;
@dynamic setPurpleColor;
@dynamic setBrownColor;
@dynamic setClearColor;

- (NSString *(^)(UIColor *color))setColor {
    return ^(UIColor *color) {
        objc_setAssociatedObject(self, "NSString_Attribute_Color", color, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}

- (NSString *(^)(NSInteger rgb))setColorWithRGB {
    return ^(NSInteger rgb) {
        return self.setColor(kUIColorFromRGB(rgb));
    };
}

- (NSString *(^)(NSString *name))setColorWithName {
    return ^(NSString *name) {
        if(!name) return self;
        SEL commonColor = NSSelectorFromString([NSString stringWithFormat:@"%@Color", name]);
        UIColor *colorFromName = [UIColor performSelector:commonColor];
        return self.setColor(colorFromName);
    };
}

- (NSString *(^)())setBlackColor {
    return ^() {
        return self.setColor([UIColor blackColor]);
    };
}

- (NSString *(^)())setDarkGrayColor {
    return ^() {
        return self.setColor([UIColor darkGrayColor]);
    };
}

- (NSString *(^)())setLightGrayColor {
    return ^() {
        return self.setColor([UIColor lightGrayColor]);
    };
}

- (NSString *(^)())setWhiteColor {
    return ^() {
        return self.setColor([UIColor whiteColor]);
    };
}

- (NSString *(^)())setGrayColor {
    return ^() {
        return self.setColor([UIColor grayColor]);
    };
}

- (NSString *(^)())setRedColor {
    return ^() {
        return self.setColor([UIColor redColor]);
    };
}

- (NSString *(^)())setGreenColor {
    return ^() {
        return self.setColor([UIColor greenColor]);
    };
}

- (NSString *(^)())setBlueColor {
    return ^() {
        return self.setColor([UIColor blueColor]);
    };
}

- (NSString *(^)())setCyanColor {
    return ^() {
        return self.setColor([UIColor cyanColor]);
    };
}

- (NSString *(^)())setYellowColor {
    return ^() {
        return self.setColor([UIColor yellowColor]);
    };
}

- (NSString *(^)())setMagentaColor {
    return ^() {
        return self.setColor([UIColor magentaColor]);
    };
}

- (NSString *(^)())setOrangeColor {
    return ^() {
        return self.setColor([UIColor orangeColor]);
    };
}

- (NSString *(^)())setPurpleColor {
    return ^() {
        return self.setColor([UIColor purpleColor]);
    };
}

- (NSString *(^)())setBrownColor {
    return ^() {
        return self.setColor([UIColor brownColor]);
    };
}

- (NSString *(^)())setClearColor {
    return ^() {
        return self.setColor([UIColor clearColor]);
    };
}

- (UIColor *(^)())color {
    return ^() {
        return objc_getAssociatedObject(self, "NSString_Attribute_Color");
    };
}

- (NSString *(^)(UIFont *font))setFont {
    return ^(UIFont *font) {
        objc_setAssociatedObject(self, "NSString_Attribute_Font", font, OBJC_ASSOCIATION_COPY_NONATOMIC);
        return self;
    };
}

- (NSString *(^)(CGFloat size))setSystemFontSize {
    return ^(CGFloat size) {
        return self.setFont([UIFont systemFontOfSize:size]);
    };
}

- (NSString *(^)(CGFloat size))setBoldSystemFontSize {
    return ^(CGFloat size) {
        return self.setFont([UIFont boldSystemFontOfSize:size]);
    };
}

- (UIFont *(^)())font {
    return ^() {
        return objc_getAssociatedObject(self, "NSString_Attribute_Font");
    };
}

@end

@implementation NSMutableString (Simple)

+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray {
    NSMutableString *mutableStr = [format mutableCopy];
    for (NSString *str in strArray) {
        NSRange range = [mutableStr rangeOfString:@"%@"];
        if (range.location != NSNotFound) {
            [mutableStr replaceCharactersInRange:range withString:str];
        }
    }
    return mutableStr;
}

@end

@implementation NSMutableAttributedString (Simple)

+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray {
    NSMutableString *combinedStr = [NSMutableString stringWithFormat:format strings:strArray];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:combinedStr];
    NSUInteger lastLoc = 0;
    for (NSString *str in strArray) {
        if (lastLoc == NSNotFound) { return attributedString; }
        NSRange range = [combinedStr rangeOfString:str options:NSLiteralSearch range:NSMakeRange(lastLoc, combinedStr.length - lastLoc)];
        lastLoc = range.location + range.length;
        [attributedString addAttributes:@{NSForegroundColorAttributeName:str.color(), NSFontAttributeName:str.font()} range:range];
    }
    
    return attributedString;
}

@end
