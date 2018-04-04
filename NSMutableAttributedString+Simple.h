//
//  NSMutableAttributedString+Simple.h
//  reocar_ios
//
//  Created by penoty yu on 09/08/2017.
//  Copyright © 2017 reocar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import <objc/runtime.h>


@interface NSString(Simple)
// string color
@property (nonatomic, copy) NSString * (^setColor)(UIColor *color);
@property (nonatomic, copy) NSString * (^setColorWithRGB)(NSInteger rgb);
@property (nonatomic, copy) UIColor * (^color)();

// string font
@property (nonatomic, copy) NSString * (^setFont)(UIFont *font);
@property (nonatomic, copy) NSString * (^setSystemFontSize)(CGFloat size);
@property (nonatomic, copy) NSString * (^setBoldSystemFontSize)(CGFloat size);
@property (nonatomic, copy) NSString * (^setFontNameAndSize)(NSString *name, CGFloat size);
@property (nonatomic, copy) UIFont * (^font)();

// string underline
@property (nonatomic, copy) NSString * (^setUnderlineStyle)(NSNumber * underlineStyle);
@property (nonatomic, copy) NSNumber * (^underlineStyle)();
@property (nonatomic, copy) NSString * (^setUnderlineColor)(UIColor *underlineColor);
@property (nonatomic, copy) UIColor * (^underlineColor)();

// string strikeline
@property (nonatomic, copy) NSString * (^setStrikelineStyle)(NSNumber * strikelineStyle);
@property (nonatomic, copy) NSNumber * (^strikelineStyle)();
@property (nonatomic, copy) NSString * (^setStrikelineColor)(UIColor *strikelineColor);
@property (nonatomic, copy) UIColor * (^strikelineColor)();

// string background color
@property (nonatomic, copy) NSString * (^setBackgroundColor)(UIColor *backgroundColor);
@property (nonatomic, copy) UIColor * (^backgroundColor)();

@end

@interface NSMutableString (Simple)
+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray;
@end

@interface NSMutableAttributedString (Simple)
+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray;
@end
