//
//  NSString+ITTAdditions.h
//
//  Created by Jack on 11-9-19.
//  Copyright (c) 2011年 iTotem. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (Additions)

- (NSInteger)numberOfLinesWithFont:(UIFont*)font
                     withLineWidth:(NSInteger)lineWidth;
- (CGFloat)heightWithFont:(UIFont*)font
            withLineWidth:(NSInteger)lineWidth;

- (NSString *)md5;

- (BOOL)isStartWithString:(NSString*)start;

- (BOOL)isEndWithString:(NSString*)end;

@end

