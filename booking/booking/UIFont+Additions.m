//
//  UIFont+ITTAdditions.m
//
//  Created by Rainbow on 9/18/11.
//  Copyright 2011 iTotem. All rights reserved.
//

#import "UIFont+Additions.h"


@implementation UIFont (Additions)

- (CGFloat)ittLineHeight {
    return (self.ascender - self.descender) + 1;
}

@end
