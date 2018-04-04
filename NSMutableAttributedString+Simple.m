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
@dynamic setFontNameAndSize;
@dynamic font;

@dynamic setColor;
@dynamic color;
@dynamic setColorWithRGB;

@dynamic setUnderlineStyle;
@dynamic underlineStyle;
@dynamic setUnderlineColor;
@dynamic underlineColor;

@dynamic setStrikelineStyle;
@dynamic strikelineStyle;
@dynamic setStrikelineColor;
@dynamic strikelineColor;

@dynamic setBackgroundColor;
@dynamic backgroundColor;

- (void)setAttributes:(NSMutableDictionary *)attributes {
    objc_setAssociatedObject(self, "NSString_Attributes", attributes, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableDictionary *)attributes {
    if (!objc_getAssociatedObject(self, "NSString_Attributes")) {
        objc_setAssociatedObject(self, "NSString_Attributes", @{}.mutableCopy, OBJC_ASSOCIATION_RETAIN);
    }
    return (NSMutableDictionary *)objc_getAssociatedObject(self, "NSString_Attributes");
}

- (void)setAttributeWithName:(NSString *)attributeName value:(id)attributeValue {
    NSMutableDictionary *attributes = [self attributes];
    attributes[attributeName] = attributeValue;
    [self setAttributes:attributes];
}

- (id)attributeValueWithName:(NSString *)attributeName {
    return [self attributes][attributeName];
}

- (NSString *(^)(UIColor *color))setColor {
    return ^(UIColor *color) {
        [self setAttributeWithName:NSForegroundColorAttributeName value:color];
        return self;
    };
}

- (NSString *(^)(NSInteger rgb))setColorWithRGB {
    return ^(NSInteger rgb) {
        return self.setColor(kUIColorFromRGB(rgb));
    };
}

- (UIColor *(^)())color {
    return ^() {
        return [self attributeValueWithName:NSForegroundColorAttributeName];
    };
}

- (NSString *(^)(UIFont *font))setFont {
    return ^(UIFont *font) {
        [self setAttributeWithName:NSFontAttributeName value:font];
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

- (NSString *(^)(NSString *name, CGFloat size))setFontNameAndSize {
    return ^(NSString *name, CGFloat size) {
        return self.setFont([UIFont fontWithName:name size:size]);
    };
}

- (UIFont *(^)())font {
    return ^() {
        return [self attributeValueWithName:NSFontAttributeName];
    };
}

- (NSString *(^)(NSNumber * underlineStyle))setUnderlineStyle {
    return ^(NSNumber * underlineStyle){
        [self setAttributeWithName:NSUnderlineStyleAttributeName value:underlineStyle];
        return self;
    };
}

- (NSNumber * (^)())underlineStyle {
    return ^() {
        return [self attributeValueWithName:NSUnderlineStyleAttributeName];
    };
}

- (NSString *(^)(UIColor *underlineColor))setUnderlineColor {
    return ^(UIColor *underlineColor){
        [self setAttributeWithName:NSUnderlineColorAttributeName value:underlineColor];
        return self;
    };
}

- (UIColor *(^)())underlineColor {
    return ^(){
        return [self attributeValueWithName:NSUnderlineColorAttributeName];
    };
}

- (NSString *(^)(NSNumber *strikelineStyle))setStrikelineStyle {
    return ^(NSNumber * strikelineStyle){
        [self setAttributeWithName:NSStrikethroughStyleAttributeName value:strikelineStyle];
        return self;
    };
}

- (NSNumber * (^)())strikelineStyle {
    return ^() {
        return [self attributeValueWithName:NSStrikethroughStyleAttributeName];
    };
}

- (NSString *(^)(UIColor *strikelineColor))setStrikelineColor {
    return ^(UIColor *strikelineColor){
        [self setAttributeWithName:NSStrikethroughColorAttributeName value:strikelineColor];
        return self;
    };
}

- (UIColor *(^)())strikelineColor {
    return ^(){
        return [self attributeValueWithName:NSStrikethroughColorAttributeName];
    };
}

- (NSString *(^)(UIColor *backgroundColor))setBackgroundColor {
    return ^(UIColor *backgroundColor){
        [self setAttributeWithName:NSBackgroundColorAttributeName value:backgroundColor];
        return self;
    };
}

- (UIColor *(^)())backgroundColor {
    return ^(){
        return [self attributeValueWithName:NSBackgroundColorAttributeName];
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
    @try {
        NSMutableString *combinedStr = [NSMutableString stringWithFormat:format strings:strArray];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:combinedStr];
        NSUInteger lastLoc = 0;
        for (NSString *str in strArray) {
            if (lastLoc == NSNotFound) { return attributedString; }
            NSRange range = [combinedStr rangeOfString:str options:NSLiteralSearch range:NSMakeRange(lastLoc, combinedStr.length - lastLoc)];
            if (range.location != NSNotFound) {
                lastLoc = range.location + range.length;
                [attributedString addAttributes:[str attributes] range:range];
            }
        }
        return attributedString;
    }
    @catch (NSException *exception) {
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    @finally {
    }
}

@end
