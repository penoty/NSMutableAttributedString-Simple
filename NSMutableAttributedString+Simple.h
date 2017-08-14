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
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NSString(Simple)

@property (nonatomic, copy) NSString * (^setColor)(UIColor *color);
@property (nonatomic, copy) NSString * (^setColorWithRGB)(NSInteger rgb);

@property (nonatomic, copy) NSString * (^setColorWithName)(NSString *name);
@property (nonatomic, copy) NSString * (^setBlackColor)();
@property (nonatomic, copy) NSString * (^setDarkGrayColor)();
@property (nonatomic, copy) NSString * (^setLightGrayColor)();
@property (nonatomic, copy) NSString * (^setWhiteColor)();
@property (nonatomic, copy) NSString * (^setGrayColor)();
@property (nonatomic, copy) NSString * (^setRedColor)();
@property (nonatomic, copy) NSString * (^setGreenColor)();
@property (nonatomic, copy) NSString * (^setBlueColor)();
@property (nonatomic, copy) NSString * (^setCyanColor)();
@property (nonatomic, copy) NSString * (^setYellowColor)();
@property (nonatomic, copy) NSString * (^setMagentaColor)();
@property (nonatomic, copy) NSString * (^setOrangeColor)();
@property (nonatomic, copy) NSString * (^setPurpleColor)();
@property (nonatomic, copy) NSString * (^setBrownColor)();
@property (nonatomic, copy) NSString * (^setClearColor)();

@property (nonatomic, copy) UIColor * (^color)();

@property (nonatomic, copy) NSString * (^setFont)(UIFont *font);
@property (nonatomic, copy) NSString * (^setSystemFontSize)(CGFloat size);
@property (nonatomic, copy) NSString * (^setBoldSystemFontSize)(CGFloat size);
@property (nonatomic, copy) UIFont * (^font)();

@end

@interface NSMutableString (Simple)
+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray;
@end

@interface NSMutableAttributedString (Simple)
+ (instancetype)stringWithFormat:(NSString *)format strings:(NSArray *)strArray;
@end
